# SinkChart Task Automation

## build

Build the project in release mode

```bash
cargo build --release
```

## dev

Run the desktop application in development mode

```bash
cd crates/tauri-app && cargo tauri dev
```

## test

Run all tests

```bash
cargo test --workspace
```

## lint

Run clippy linter with strict settings and security lints

```bash
cargo clippy --workspace -- -D warnings -D clippy::all -D clippy::pedantic -D clippy::nursery -D clippy::cargo
```

## fmt

Format all code

```bash
cargo fmt --all
```

## audit

Run security audit

```bash
cargo audit
```

## deny

Run dependency policy checks

```bash
cargo deny check
```

## fuzz

Run fuzzing tests (requires nightly toolchain)

```bash
# Run a specific fuzz target for a short time
# Example: cargo +nightly fuzz run fuzz_target_1 -- -max_total_time=60
echo "Available fuzz targets:"
cargo +nightly fuzz list
echo ""
echo "To run fuzzing: cargo +nightly fuzz run <target_name>"
echo "To run for specific time: cargo +nightly fuzz run <target_name> -- -max_total_time=60"
```

## security

Run comprehensive security checks

```bash
cargo audit && cargo deny check && cargo clippy --workspace -- -D warnings -D clippy::all -D clippy::pedantic -D clippy::nursery -D clippy::cargo
```

## clean

Clean build artifacts

```bash
cargo clean
```

## check

Quick syntax check

```bash
cargo check --workspace
```

## docs

Generate documentation

```bash
cargo doc --workspace --open
```

## install-tools

Install required development tools (fallback if mise cargo tools fail)

```bash
echo "⚠️  This is a fallback task. Tools should be installed via 'mise install'"
echo "🔧 Installing cargo tools manually..."
cargo install cargo-audit cargo-deny cargo-fuzz tauri-cli
echo "✅ Manual tool installation completed"
echo "💡 If mise cargo tools are working, you can skip this task"
```

## release-check

Check if repository is ready for release

```bash
cog check
```

## release

Create a new release with automatic version bump

```bash
cog bump --auto
```

## changelog

Generate changelog from conventional commits

```bash
cog changelog
```

## commit-check

Verify commit message follows conventional commits

```bash
# Verify the last commit message
cog verify "$(git log -1 --pretty=format:%s)"
```

## spellcheck

Check spelling in source code and documentation

```bash
typos
```

## spellcheck-fix

Fix spelling errors automatically

```bash
typos --write-changes
```

## install-deps

Auto-detect distribution and install system dependencies

```bash
if command -v pacman &> /dev/null; then
    mask install-deps-arch
elif command -v apt-get &> /dev/null; then
    mask install-deps-debian  
elif command -v dnf &> /dev/null; then
    mask install-deps-fedora
else
    echo "❌ Unsupported Linux distribution detected"
    echo "📋 Please install system dependencies manually:"
    echo "🔗 https://v2.tauri.app/start/prerequisites/"
    exit 1
fi
```

## install-deps-arch

Install system dependencies for Arch Linux

```bash
sudo pacman -Syu
sudo pacman -S --needed \
  webkit2gtk-4.1 \
  base-devel \
  curl \
  wget \
  file \
  openssl \
  appmenu-gtk-module \
  libappindicator-gtk3 \
  librsvg \
  xdotool
```

## install-deps-debian

Install system dependencies for Debian/Ubuntu

```bash
sudo apt update
sudo apt install -y \
  libwebkit2gtk-4.1-dev \
  build-essential \
  curl \
  wget \
  file \
  libxdo-dev \
  libssl-dev \
  libayatana-appindicator3-dev \
  librsvg2-dev
```

## install-deps-fedora

Install system dependencies for Fedora

```bash
sudo dnf check-update
sudo dnf install -y \
  webkit2gtk4.1-devel \
  openssl-devel \
  curl \
  wget \
  file \
  libappindicator-gtk3-devel \
  librsvg2-devel \
  libxdo-devel
sudo dnf group install -y "C Development Tools and Libraries"
```