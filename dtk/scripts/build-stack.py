#!/usr/bin/env python3
"""
Docker Template Kit - Build Stack Orchestrator
Equivalent to build-stack.sh but with template-generated builds
"""

import os
import sys
import yaml
import subprocess
import argparse
from pathlib import Path
from concurrent.futures import ThreadPoolExecutor, as_completed

class BuildStackOrchestrator:
    def __init__(self, config_path, generated_dir):
        self.config_path = Path(config_path)
        self.generated_dir = Path(generated_dir)
        
        # Load configuration
        with open(self.config_path, 'r') as f:
            self.config = yaml.safe_load(f)
    
    def run_command(self, cmd, cwd=None):
        """Run shell command and return result"""
        try:
            result = subprocess.run(
                cmd, 
                shell=True, 
                cwd=cwd,
                capture_output=True, 
                text=True, 
                check=True
            )
            return True, result.stdout
        except subprocess.CalledProcessError as e:
            return False, f"Command failed: {cmd}\\nError: {e.stderr}"
    
    def build_image(self, dockerfile_path, env_script_path, tags):
        """Build single Docker image"""
        dockerfile_path = Path(dockerfile_path)
        env_script_path = Path(env_script_path)
        
        if not dockerfile_path.exists():
            return False, f"Dockerfile not found: {dockerfile_path}"
        
        if not env_script_path.exists():
            return False, f"Environment script not found: {env_script_path}"
        
        # Source environment variables
        source_cmd = f"source {env_script_path} && env"
        success, env_output = self.run_command(source_cmd)
        
        if not success:
            return False, f"Failed to source environment: {env_output}"
        
        # Parse environment variables
        env_vars = {}
        for line in env_output.split('\\n'):
            if '=' in line and not line.startswith('_'):
                key, value = line.split('=', 1)
                env_vars[key] = value
        
        # Build Docker image
        build_args = env_vars.get('DK_BUILD_ARGS', '')
        primary_tag = tags[0] if tags else "temp-build"
        
        build_cmd = f"docker build {build_args} -t {primary_tag} -f {dockerfile_path} ."
        
        print(f"Building: {primary_tag}")
        print(f"Command: {build_cmd}")
        
        success, output = self.run_command(build_cmd, cwd=dockerfile_path.parent)
        
        if not success:
            return False, f"Build failed for {primary_tag}: {output}"
        
        # Tag additional tags
        for tag in tags[1:]:
            tag_cmd = f"docker tag {primary_tag} {tag}"
            tag_success, tag_output = self.run_command(tag_cmd)
            if not tag_success:
                print(f"Warning: Failed to tag {tag}: {tag_output}")
        
        return True, f"Successfully built {primary_tag}"
    
    def push_image(self, tags):
        """Push Docker image with all tags"""
        results = []
        
        for tag in tags:
            push_cmd = f"docker push {tag}"
            print(f"Pushing: {tag}")
            
            success, output = self.run_command(push_cmd)
            results.append((tag, success, output))
        
        return results
    
    def get_build_order(self, sequence_name):
        """Get dependency-ordered build list for sequence"""
        sequence = None
        for seq in self.config['build_sequences']:
            if seq['name'] == sequence_name:
                sequence = seq
                break
        
        if not sequence:
            raise ValueError(f"Build sequence {sequence_name} not found")
        
        # Create dependency-ordered build list
        builds = []
        
        for os_version in sequence['os_versions']:
            for python_version in sequence['python_versions']:
                for layer_name in sequence['layers']:
                    # Find layer configuration
                    layer_config = None
                    for l in self.config['build_layers']:
                        if l['name'] == layer_name:
                            layer_config = l
                            break
                    
                    if not layer_config:
                        continue
                    
                    # Generate file paths
                    if layer_name == 'base':
                        dockerfile = self.generated_dir / f"Dockerfile.{os_version}-{layer_name}"
                        env_script = self.generated_dir / f"_env.{os_version}.sh"
                    else:
                        dockerfile = self.generated_dir / f"Dockerfile.{os_version}-py{python_version}-{layer_name}"
                        env_script = self.generated_dir / f"_env.{os_version}-py{python_version}-{layer_name}.sh"
                    
                    # Generate tags
                    tags = []
                    for tag_template in layer_config['tags']:
                        tag = tag_template.replace('${os_version}', os_version)
                        tag = tag.replace('${os_major}', os_version.split('.')[0])
                        tag = tag.replace('${python_version}', python_version)
                        tags.append(tag)
                    
                    builds.append({
                        'name': f"{os_version}-py{python_version}-{layer_name}",
                        'dockerfile': dockerfile,
                        'env_script': env_script,
                        'tags': tags,
                        'depends_on': layer_config['depends_on']
                    })
        
        return builds
    
    def build_sequence_sequential(self, sequence_name, push=False):
        """Build sequence with dependency order (sequential)"""
        builds = self.get_build_order(sequence_name)
        
        print(f"Building sequence: {sequence_name}")
        print(f"Total builds: {len(builds)}")
        
        completed_layers = set()
        results = []
        
        for build in builds:
            # Check dependencies
            if build['depends_on'] and build['depends_on'] not in completed_layers:
                print(f"Skipping {build['name']}: dependency {build['depends_on']} not built")
                continue
            
            # Build image
            success, message = self.build_image(
                build['dockerfile'], 
                build['env_script'], 
                build['tags']
            )
            
            results.append({
                'build': build['name'],
                'success': success,
                'message': message
            })
            
            if success:
                # Extract layer name from build name
                layer_name = build['name'].split('-')[-1]
                completed_layers.add(layer_name)
                
                # Push if requested
                if push:
                    push_results = self.push_image(build['tags'])
                    for tag, push_success, push_output in push_results:
                        results.append({
                            'build': f"push-{tag}",
                            'success': push_success,
                            'message': push_output
                        })
            else:
                print(f"Build failed: {build['name']}")
                print(f"Error: {message}")
                break
        
        return results
    
    def build_sequence_parallel(self, sequence_name, push=False, max_workers=3):
        """Build sequence with parallel execution where possible"""
        builds = self.get_build_order(sequence_name)
        
        print(f"Building sequence: {sequence_name} (parallel)")
        print(f"Total builds: {len(builds)}")
        
        # Group builds by dependency level
        dependency_levels = {}
        for build in builds:
            level = 0 if not build['depends_on'] else 1
            # Simple dependency grouping - could be enhanced
            if level not in dependency_levels:
                dependency_levels[level] = []
            dependency_levels[level].append(build)
        
        results = []
        
        # Build each dependency level
        for level in sorted(dependency_levels.keys()):
            level_builds = dependency_levels[level]
            print(f"Building dependency level {level}: {len(level_builds)} builds")
            
            with ThreadPoolExecutor(max_workers=max_workers) as executor:
                # Submit builds
                futures = {}
                for build in level_builds:
                    future = executor.submit(
                        self.build_image,
                        build['dockerfile'],
                        build['env_script'], 
                        build['tags']
                    )
                    futures[future] = build
                
                # Collect results
                for future in as_completed(futures):
                    build = futures[future]
                    try:
                        success, message = future.result()
                        results.append({
                            'build': build['name'],
                            'success': success,
                            'message': message
                        })
                        
                        if success and push:
                            push_results = self.push_image(build['tags'])
                            for tag, push_success, push_output in push_results:
                                results.append({
                                    'build': f"push-{tag}",
                                    'success': push_success,
                                    'message': push_output
                                })
                    except Exception as e:
                        results.append({
                            'build': build['name'],
                            'success': False,
                            'message': f"Exception: {str(e)}"
                        })
        
        return results
    
    def print_results(self, results):
        """Print build results summary"""
        print("\\nBuild Results Summary")
        print("=" * 50)
        
        successful = 0
        failed = 0
        
        for result in results:
            status = "✓" if result['success'] else "✗"
            print(f"{status} {result['build']}")
            if not result['success']:
                print(f"  Error: {result['message']}")
                failed += 1
            else:
                successful += 1
        
        print(f"\\nTotal: {len(results)} | Success: {successful} | Failed: {failed}")

def main():
    parser = argparse.ArgumentParser(description='Build Docker stack from templates')
    parser.add_argument('--config', default='config/build-matrix.yaml',
                       help='Path to build matrix configuration')
    parser.add_argument('--generated', default='generated',
                       help='Path to generated files directory')
    parser.add_argument('--sequence', default='modern-stack',
                       help='Build sequence to execute')
    parser.add_argument('--push', action='store_true',
                       help='Push images after building')
    parser.add_argument('--parallel', action='store_true',
                       help='Use parallel builds where possible')
    parser.add_argument('--workers', type=int, default=3,
                       help='Number of parallel workers (default: 3)')
    
    args = parser.parse_args()
    
    # Find script directory for relative paths
    script_dir = Path(__file__).parent.parent
    config_path = script_dir / args.config
    generated_dir = script_dir / args.generated
    
    try:
        orchestrator = BuildStackOrchestrator(config_path, generated_dir)
        
        if args.parallel:
            results = orchestrator.build_sequence_parallel(
                args.sequence, 
                push=args.push,
                max_workers=args.workers
            )
        else:
            results = orchestrator.build_sequence_sequential(
                args.sequence,
                push=args.push
            )
        
        orchestrator.print_results(results)
        
        # Exit with error code if any builds failed
        failed_builds = [r for r in results if not r['success']]
        if failed_builds:
            sys.exit(1)
        
    except Exception as e:
        print(f"Error: {e}", file=sys.stderr)
        sys.exit(1)

if __name__ == "__main__":
    main()