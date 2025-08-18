#!/usr/bin/env python3
"""
Docker Template Kit - Dockerfile Generator
Generates Dockerfiles from Jinja2 templates based on build matrix configuration
"""

import os
import sys
import yaml
import argparse
from pathlib import Path
from jinja2 import Environment, FileSystemLoader, select_autoescape

class DockerfileGenerator:
    def __init__(self, config_path, templates_dir, output_dir):
        self.config_path = Path(config_path)
        self.templates_dir = Path(templates_dir)
        self.output_dir = Path(output_dir)
        
        # Load configuration
        with open(self.config_path, 'r') as f:
            self.config = yaml.safe_load(f)
        
        # Setup Jinja2 environment
        self.env = Environment(
            loader=FileSystemLoader(str(self.templates_dir)),
            autoescape=select_autoescape(['html', 'xml'])
        )
        
        # Create output directory
        self.output_dir.mkdir(parents=True, exist_ok=True)
    
    def get_python_config(self, python_version):
        """Get Python configuration for specific version"""
        for py_config in self.config['python_versions']:
            if py_config['version'] == python_version:
                return py_config
        raise ValueError(f"Python version {python_version} not found in configuration")
    
    def generate_dockerfile(self, layer, os_version, python_version=None):
        """Generate a single Dockerfile for given parameters"""
        layer_config = None
        for l in self.config['build_layers']:
            if l['name'] == layer:
                layer_config = l
                break
        
        if not layer_config:
            raise ValueError(f"Layer {layer} not found in configuration")
        
        template_name = layer_config['template']
        template = self.env.get_template(template_name)
        
        # Prepare template variables
        variables = {
            'os_version': os_version,
            'os_major': os_version.split('.')[0],
            'build_config': self.config['build_config'],
            'layer_config': layer_config
        }
        
        # Add Python configuration if specified
        if python_version:
            variables['python_config'] = self.get_python_config(python_version)
            variables['python_version'] = python_version
        
        # Render template
        dockerfile_content = template.render(**variables)
        
        # Generate output filename
        if python_version:
            output_file = self.output_dir / f"Dockerfile.{os_version}-py{python_version}-{layer}"
        else:
            output_file = self.output_dir / f"Dockerfile.{os_version}-{layer}"
        
        # Write Dockerfile
        with open(output_file, 'w') as f:
            f.write(dockerfile_content)
        
        return output_file
    
    def generate_env_script(self, os_version, python_version=None, layer=None):
        """Generate _env.sh script equivalent for build configuration"""
        python_config = self.get_python_config(python_version) if python_version else None
        
        env_content = f"""#!/bin/bash
# Generated environment configuration for {os_version}"""
        
        if python_config:
            env_content += f" - Python {python_version}"
        if layer:
            env_content += f" - {layer} layer"
        
        env_content += f"""

# Base OS configuration
export UBUNTU_VER_BASE={os_version.split('.')[0]}
export UBUNTU_VER={os_version}
export TZ_NAME="{self.config['build_config']['timezone']}"
"""
        
        if python_config:
            env_content += f"""
# Python configuration
export PY_VER_BASE={python_config['version']}
export PY_VER_BUMP={python_config['bump']}
export PY_VER=${{PY_VER_BASE}}.${{PY_VER_BUMP}}
"""
        
        # Docker tags
        registry = self.config['build_config']['registry']
        env_content += f"""
# Docker tags
export dockertag1={registry}/ubuntu
export dockertag2={registry}/ubuntu:{os_version}
export dockertag3={registry}/ubuntu:latest
"""
        
        if python_config:
            env_content += f"""export dockertag4={registry}/ubuntu:py{python_config['version']}
export dockertag={registry}/ubuntu:{os_version}-py{python_config['version']}-{layer or 'base'}
"""
        else:
            env_content += f"""export dockertag={registry}/ubuntu:{os_version}
"""
        
        # Build arguments
        build_args = f"--build-arg UBUNTU_VER={os_version} --build-arg TZ_NAME={self.config['build_config']['timezone']}"
        if python_config:
            build_args += f" --build-arg PY_VER_BASE={python_config['version']} --build-arg PY_VER=${{PY_VER}}"
        
        env_content += f"""
# Build arguments
export DK_BUILD_ARGS="{build_args}"

# Build scripts
dkbuildprebuildscript=dkbuildprebuildscript.sh
dkbuildbuildsuccessscript=dkbuildbuildsuccessscript.sh
dkbuildfailedscript=dkbuildfailedscript.sh
dkbuildpostbuildscript=dkbuildpostbuildscript.sh
"""
        
        # Output file
        if python_version and layer:
            env_file = self.output_dir / f"_env.{os_version}-py{python_version}-{layer}.sh"
        elif python_version:
            env_file = self.output_dir / f"_env.{os_version}-py{python_version}.sh"
        else:
            env_file = self.output_dir / f"_env.{os_version}.sh"
        
        with open(env_file, 'w') as f:
            f.write(env_content)
        
        # Make executable
        os.chmod(env_file, 0o755)
        
        return env_file
    
    def generate_build_sequence(self, sequence_name):
        """Generate all Dockerfiles for a build sequence"""
        sequence = None
        for seq in self.config['build_sequences']:
            if seq['name'] == sequence_name:
                sequence = seq
                break
        
        if not sequence:
            raise ValueError(f"Build sequence {sequence_name} not found")
        
        generated_files = []
        
        for os_version in sequence['os_versions']:
            for python_version in sequence['python_versions']:
                for layer in sequence['layers']:
                    # Skip Python layer for base
                    if layer == 'base':
                        dockerfile = self.generate_dockerfile(layer, os_version)
                        env_script = self.generate_env_script(os_version)
                    else:
                        dockerfile = self.generate_dockerfile(layer, os_version, python_version)
                        env_script = self.generate_env_script(os_version, python_version, layer)
                    
                    generated_files.extend([dockerfile, env_script])
        
        return generated_files
    
    def generate_all(self):
        """Generate all Dockerfiles for all sequences"""
        all_files = []
        
        for sequence in self.config['build_sequences']:
            files = self.generate_build_sequence(sequence['name'])
            all_files.extend(files)
        
        return all_files
    
    def print_build_summary(self):
        """Print build matrix summary"""
        print(f"Docker Template Kit Build Matrix")
        print(f"================================")
        print(f"OS Versions: {', '.join(self.config['os_versions'])}")
        print(f"Python Versions: {', '.join([p['version'] for p in self.config['python_versions']])}")
        print(f"Build Layers: {', '.join([l['name'] for l in self.config['build_layers']])}")
        print(f"Build Sequences:")
        
        for seq in self.config['build_sequences']:
            print(f"  - {seq['name']}: {seq['description']}")
            total_builds = len(seq['os_versions']) * len(seq['python_versions']) * len(seq['layers'])
            print(f"    Generates {total_builds} build targets")

def main():
    parser = argparse.ArgumentParser(description='Generate Dockerfiles from templates')
    parser.add_argument('--config', default='config/build-matrix.yaml', 
                       help='Path to build matrix configuration')
    parser.add_argument('--templates', default='templates',
                       help='Path to template directory')
    parser.add_argument('--output', default='generated',
                       help='Output directory for generated files')
    parser.add_argument('--sequence', 
                       help='Generate specific build sequence only')
    parser.add_argument('--summary', action='store_true',
                       help='Print build summary and exit')
    
    args = parser.parse_args()
    
    # Find script directory for relative paths
    script_dir = Path(__file__).parent.parent
    config_path = script_dir / args.config
    templates_dir = script_dir / args.templates
    output_dir = script_dir / args.output
    
    try:
        generator = DockerfileGenerator(config_path, templates_dir, output_dir)
        
        if args.summary:
            generator.print_build_summary()
            return
        
        if args.sequence:
            files = generator.generate_build_sequence(args.sequence)
            print(f"Generated {len(files)} files for sequence '{args.sequence}'")
        else:
            files = generator.generate_all()
            print(f"Generated {len(files)} total files")
        
        print(f"Output directory: {output_dir}")
        
    except Exception as e:
        print(f"Error: {e}", file=sys.stderr)
        sys.exit(1)

if __name__ == "__main__":
    main()