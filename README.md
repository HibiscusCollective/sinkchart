# SinkChart

A plugin-based map management tool designed specifically for video game exploration.

## Overview

SinkChart is an alternative to pre-populated maps that spoil the exploration experience. It enables players to create, annotate and share game maps with unprecedented ease and precision. The platform provides a clean, intuitive interface where players can load blank game maps and enhance them with custom pins, detailed notes, and strategic annotations.

## Features

- **Plugin-based Architecture**: Modular system allowing game-specific customization
- **Cross-platform Support**: Available on desktop, mobile, and web
- **Custom Annotations**: Mark loot spawns, raid strategies, exploration discoveries
- **Local Storage**: Save maps locally with lightweight file format
- **Map Sharing**: Share annotated maps with other players
- **Privacy First**: No data collection, everything stored locally

## Development Status

🚧 **Early Development** - This project is in initial development phase.

## License

This project is licensed under the GNU Affero General Public License v3.0 or later (AGPL-3.0-or-later).

### What this means:

- ✅ You can use this software for any purpose
- ✅ You can modify the source code
- ✅ You can distribute copies
- ✅ You can distribute modified versions
- ⚠️ **Network Use Clause**: If you run this software on a server and provide it as a service to others, you must make the source code available to users
- ⚠️ All derivative works must also be licensed under AGPL-3.0-or-later
- ⚠️ Changes must be documented

### Source Code Availability

The complete source code for SinkChart is available in this repository. This includes:
- All application code
- Build scripts and configuration
- Documentation
- Asset sources where applicable

If you receive this software as a service over a network, you have the right to receive the corresponding source code.

## Getting Started

### Prerequisites

- Git
- Internet connection for tool installation
- Supported OS: Linux, macOS, or Windows

#### System Dependencies

The bootstrap script will attempt to install these automatically, but you may need to install them manually:

**Linux (Arch/Manjaro):**
```bash
sudo pacman -S webkit2gtk-4.1 gtk3 libayatana-appindicator openssl pkg-config libxdo base-devel
```

**Linux (Debian/Ubuntu):**
```bash
sudo apt-get update
sudo apt-get install libwebkit2gtk-4.1-dev libgtk-3-dev libayatana-appindicator3-dev libssl-dev pkg-config libxdo-dev build-essential
```

**Linux (Fedora):**
```bash
sudo dnf install webkit2gtk4.1-devel gtk3-devel libappindicator-gtk3-devel openssl-devel pkgconf-pkg-config libxdo-devel gcc gcc-c++ make
```

**macOS:**
```bash
# Xcode command line tools (will be prompted automatically)
xcode-select --install
# Homebrew will be installed automatically if needed
brew install pkg-config openssl
```

**Windows:**
```powershell
# Microsoft C++ Build Tools (will be installed automatically)
# Download: https://aka.ms/vs/17/release/vs_buildtools.exe
# Select "C++ build tools" workload
```

### Quick Start

```bash
# Clone the repository
git clone https://github.com/HibiscusCollective/sinkchart.git
cd sinkchart

# Bootstrap development environment (installs Rust, Node.js, mask, cocogitto, etc.)
./scripts/bootstrap.sh    # Linux/macOS
# or
.\scripts\bootstrap.ps1   # Windows

# Reload your shell or restart terminal

# Build the project
mask build

# Run in development mode
mask dev
```

### Available Commands

After bootstrap, you can use these commands:

- `mask build` - Build the project in release mode
- `mask dev` - Run desktop application in development mode
- `mask test` - Run all tests
- `mask lint` - Run linter with security checks
- `mask fmt` - Format code
- `mask audit` - Security vulnerability audit
- `mask deny` - Dependency policy checks
- `mask security` - Comprehensive security scan
- `mask spellcheck` - Check spelling in code and docs
- `mask release` - Create new release with version bump
- `mask changelog` - Generate changelog from commits

### Development Workflow

1. **Make changes** following conventional commits
2. **Test changes**: `mask test && mask security && mask spellcheck`
3. **Format code**: `mask fmt`
4. **Commit changes**:
   ```bash
   # Interactive conventional commit (recommended)
   cog commit
   
   # Or manual commit with DCO
   git commit -s -m "feat: add new feature"
   ```
5. **Verify commit**: `mask commit-check`

## Contributing

We welcome contributions! Please ensure:

1. All contributions are compatible with AGPL-3.0-or-later
2. Code follows the existing style and passes all checks
3. New features include appropriate tests
4. Documentation is updated as needed

## Support

- 📖 Documentation: `docs/`
- 🐛 Issue Tracker: GitHub Issues
- 💬 Discussions: GitHub Discussions

---

**Free Software**: SinkChart is free software, and you are welcome to redistribute it under the terms of the AGPL-3.0-or-later license.