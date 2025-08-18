# Docker Template Kit (DTK)

**Template-based Docker infrastructure for multi-OS, multi-Python, multi-layer builds**

Replaces OS-specific directory duplication (`pto-22.04/`, `pto-20.04/`) with a unified template system that generates equivalent builds for any OS version.

## Architecture

### Template System
- **Base Layer**: `base.dockerfile.j2` - Ubuntu foundation with essential packages
- **Python Layer**: `python.dockerfile.j2` - Python runtime (source compilation or packages)  
- **Node Layer**: `node.dockerfile.j2` - Node.js integration with development tools
- **ML-Tooled Layer**: `ml-tooled.dockerfile.j2` - Complete ML/data science environment

### Build Matrix
Supports multiple combinations via `config/build-matrix.yaml`:
- **OS Versions**: 22.04, 20.04, 24.04 (extensible)
- **Python Versions**: 3.10, 3.11 (source), 3.6 (packages)
- **Build Sequences**: Modern stack + Legacy stack (for coaiapy)

## Quick Start

### 1. Generate Dockerfiles
```bash
cd dtk/
python3 scripts/generate-dockerfiles.py --summary
python3 scripts/generate-dockerfiles.py
```

### 2. Build Stack (Sequential)
```bash
# Modern stack: base → py3.10 → node → ml-tooled
python3 scripts/build-stack.py --sequence modern-stack

# Legacy stack: base → py3.6 → node (for coaiapy)
python3 scripts/build-stack.py --sequence legacy-stack
```

### 3. Build with Push
```bash
python3 scripts/build-stack.py --sequence modern-stack --push
```

### 4. Parallel Builds
```bash
python3 scripts/build-stack.py --sequence modern-stack --parallel --workers 4
```

## Build Sequences

### Modern Stack
**Equivalent to**: `pto-22.04/build-stack.sh`
```
base → py3.10 → node → ml-tooled
base → py3.11 → node → ml-tooled
```
- **OS Support**: 22.04, 20.04, 24.04
- **Python**: 3.10.17, 3.11.10 (compiled from source)
- **Features**: Code-server, ML libraries, Google Cloud CLI

### Legacy Stack  
**For coaiapy compatibility**
```
base → py3.6 → node
```
- **OS Support**: 22.04 (uses 18.04 base for py3.6)
- **Python**: 3.6.15 (system packages)
- **Node**: 16.x (compatible with py3.6)

## Generated Output

### Directory Structure
```
dtk/generated/
├── Dockerfile.22.04-base
├── Dockerfile.22.04-py3.10-python  
├── Dockerfile.22.04-py3.10-node
├── Dockerfile.22.04-py3.10-ml-tooled
├── Dockerfile.22.04-py3.6-python
├── Dockerfile.22.04-py3.6-node
├── _env.22.04.sh
├── _env.22.04-py3.10-python.sh
└── ... (all combinations)
```

### Docker Tags
Templates generate equivalent tags to current system:
```bash
# Base images
jgwill/ubuntu:22.04
jgwill/ubuntu:22
jgwill/ubuntu:latest

# Python images  
jgwill/ubuntu:22.04-py3.10-base
jgwill/ubuntu:py3.10

# Node images
jgwill/ubuntu:22.04-py3.10-node 
jgwill/ubuntu:py3.10-node

# ML images
jgwill/ubuntu:22.04-py3.10-ml
jgwill/ubuntu:py3.10-ml
```

## Configuration

### Adding New OS Versions
Edit `config/build-matrix.yaml`:
```yaml
os_versions:
  - "22.04"
  - "20.04" 
  - "24.04"
  - "24.10"  # Add new version
```

### Adding New Python Versions
```yaml
python_versions:
  - version: "3.12"
    bump: "7"
    compilation_method: "source"
    base_os: "22.04"
```

### Custom Build Sequences
```yaml
build_sequences:
  - name: "custom-stack"
    description: "Custom build sequence"
    os_versions: ["24.04"]
    python_versions: ["3.12"]
    layers: ["base", "python", "node"]
```

## Migration from pto-22.04/

### Equivalent Commands
| Original | DTK Equivalent |
|----------|----------------|
| `cd pto-22.04 && ./build-stack.sh` | `python3 scripts/build-stack.py --sequence modern-stack` |
| Build py3.6 manually | `python3 scripts/build-stack.py --sequence legacy-stack` |
| Add new OS version | Edit `config/build-matrix.yaml` + regenerate |

### Benefits
- **No Duplication**: Single template → multiple OS versions
- **Consistency**: Unified build patterns across variants  
- **Maintainability**: Central configuration management
- **Scalability**: Easy addition of new OS/Python versions
- **Automation**: Dependency-aware build orchestration

## Advanced Usage

### Custom Template Variables
Templates support custom variables via configuration:
```yaml
build_config:
  custom_packages: ["vim", "htop", "tree"]
  development_mode: true
```

### Build Optimization
- **Cache Mounts**: Persistent apt/pip/npm caches
- **BuildKit**: Modern Docker build engine
- **Parallel Builds**: Concurrent image building
- **Registry Caching**: Shared layer caching

### CI/CD Integration
Generated files work with:
- **GitHub Actions**: Matrix builds
- **GitLab CI**: Multi-configuration jobs  
- **Docker Buildx**: Multi-platform builds
- **Docker Bake**: Advanced build orchestration

## Troubleshooting

### Common Issues
1. **Missing Templates**: Ensure all `.j2` files exist in `templates/`
2. **Build Dependencies**: Check layer dependency order in configuration
3. **Environment Variables**: Verify `_env.sh` scripts are generated correctly
4. **Docker Tags**: Confirm tag templates match expected naming

### Debug Mode
```bash
python3 scripts/generate-dockerfiles.py --sequence modern-stack --verbose
python3 scripts/build-stack.py --sequence modern-stack --debug
```

---

**Next Steps**: 
1. Test generated Dockerfiles match existing builds
2. Migrate additional OS versions (24.04, 18.04)
3. Add CI/CD integration with GitHub Actions matrix
4. Implement Docker Bake configuration for advanced builds