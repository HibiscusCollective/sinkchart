#!/bin/bash
set -euo pipefail

# SinkChart Bootstrap Script
# Sets up the development environment on Linux and macOS

echo "🚀 Bootstrapping SinkChart development environment..."

# Check if we're on a supported platform
case "$(uname)" in
    "Linux"|"Darwin")
        echo "✅ Detected $(uname) - supported platform"
        ;;
    *)
        echo "❌ Unsupported platform: $(uname)"
        echo "This script supports Linux and macOS only."
        echo "For Windows, use bootstrap.ps1"
        exit 1
        ;;
esac

# Install system dependencies
install_system_deps() {
    local os_type="$(uname)"
    
    if [[ "$os_type" == "Darwin" ]]; then
        # macOS with Homebrew
        if ! command -v brew &> /dev/null; then
            echo "📦 Homebrew not found. Installing Homebrew..."
            read -p "Install Homebrew? (y/N): " -n 1 -r
            echo
            if [[ $REPLY =~ ^[Yy]$ ]]; then
                /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
                # Add Homebrew to PATH for current session
                eval "$(/opt/homebrew/bin/brew shellenv)"
            else
                echo "❌ Homebrew required for system dependencies. Please install manually:"
                echo "   /bin/bash -c \"\$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)\""
                return 1
            fi
        fi
        
        # Check if Xcode command line tools are installed
        if ! xcode-select -p &> /dev/null; then
            echo "📦 Installing Xcode command line tools..."
            xcode-select --install
            echo "⏳ Please complete the Xcode installation in the dialog, then re-run this script"
            exit 0
        fi
        
        echo "📦 Installing macOS system dependencies..."
        brew install --quiet \
            pkg-config \
            openssl \
            || {
                echo "⚠️  Failed to install some dependencies via Homebrew"
                echo "📋 Manual installation guide:"
                echo "   brew install pkg-config openssl"
                return 1
            }
            
    elif [[ "$os_type" == "Linux" ]]; then
        # Use mask task for Linux dependency installation
        if command -v mask &> /dev/null; then
            echo "📦 Installing Linux system dependencies..."
            mask install-deps || return 1
        else
            echo "⚠️  mask not available yet, will install system dependencies after mise setup"
            return 0
        fi
    fi
    
    echo "✅ System dependencies installed successfully"
    return 0
}

echo "🔧 Installing system dependencies..."
install_system_deps

# Install mise if not already installed
if ! command -v mise &> /dev/null; then
    echo "📦 Installing mise..."
    curl https://mise.run | sh
    
    # Add mise to PATH for this session
    export PATH="$HOME/.local/bin:$PATH"
    
    # Add to shell profile
    case "$SHELL" in
        */bash)
            echo 'export PATH="$HOME/.local/bin:$PATH"' >> ~/.bashrc
            echo 'eval "$(mise activate bash)"' >> ~/.bashrc
            ;;
        */zsh)
            echo 'export PATH="$HOME/.local/bin:$PATH"' >> ~/.zshrc
            echo 'eval "$(mise activate zsh)"' >> ~/.zshrc
            ;;
        */fish)
            echo 'fish_add_path ~/.local/bin' >> ~/.config/fish/config.fish
            echo 'mise activate fish | source' >> ~/.config/fish/config.fish
            ;;
        *)
            echo "⚠️  Please manually add mise to your shell profile"
            echo "   export PATH=\"\$HOME/.local/bin:\$PATH\""
            echo "   eval \"\$(mise activate)\""
            ;;
    esac
else
    echo "✅ mise already installed"
fi

# Install tools defined in mise.toml
echo "🔧 Installing development tools..."
mise install

# Install security tools (fallback if mise cargo tools didn't work)
echo "🔒 Checking if cargo tools are available..."
if ! command -v cargo-audit &> /dev/null; then
    echo "⚠️  Cargo tools not found, installing manually..."
    mask install-tools
else
    echo "✅ Cargo tools already available via mise"
fi

# Install system dependencies for Linux if not done earlier
if [[ "$(uname)" == "Linux" ]] && ! command -v webkit2gtk-4.1 &> /dev/null; then
    echo "🔧 Installing Linux system dependencies..."
    mask install-deps || {
        echo "⚠️  Failed to install system dependencies automatically"
        echo "💡 Please run 'mask install-deps' manually or see:"
        echo "🔗 https://v2.tauri.app/start/prerequisites/"
    }
fi

# Verify installation
echo "✅ Verifying installation..."
mise --version
cargo --version
node --version
mask --version

echo ""
echo "🎉 Bootstrap completed successfully!"
echo ""
echo "Next steps:"
echo "1. Reload your shell or run: source ~/.bashrc (or ~/.zshrc, or restart fish)"
echo "2. Run: mask build"
echo "3. Run: mask dev"
echo ""
echo "Available commands:"
echo "- mask build        # Build the project"
echo "- mask dev          # Run development server"
echo "- mask test         # Run tests"
echo "- mask lint         # Run linter with security checks"
echo "- mask fmt          # Format code"
echo "- mask audit        # Security vulnerability audit"
echo "- mask deny         # Dependency policy checks"
echo "- mask security     # Comprehensive security scan"
echo "- mask spellcheck   # Check spelling in code and docs"
echo "- mask fuzz         # Fuzzing tests"
echo "- mask release      # Create new release"
echo "- mask changelog    # Generate changelog"
echo "- mask commit-check # Verify conventional commits"