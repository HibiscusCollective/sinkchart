# SinkChart Bootstrap Script for Windows
# Sets up the development environment on Windows

Write-Host "🚀 Bootstrapping SinkChart development environment on Windows..." -ForegroundColor Green

# Check if we're on Windows
if ($PSVersionTable.Platform -and $PSVersionTable.Platform -ne "Win32NT") {
    Write-Host "❌ This script is for Windows only." -ForegroundColor Red
    Write-Host "For Linux/macOS, use bootstrap.sh"
    exit 1
}

# Function to check if Microsoft C++ Build Tools are installed
function Test-CppBuildTools {
    $vsWhere = "${env:ProgramFiles(x86)}\Microsoft Visual Studio\Installer\vswhere.exe"
    if (Test-Path $vsWhere) {
        $installations = & $vsWhere -products * -requires Microsoft.VisualStudio.Component.VC.Tools.x86.x64 -format json | ConvertFrom-Json
        return $installations.Count -gt 0
    }
    return $false
}

# Install Microsoft C++ Build Tools if not present
if (-not (Test-CppBuildTools)) {
    Write-Host "📦 Microsoft C++ Build Tools not found. Installing..." -ForegroundColor Yellow
    
    $confirmation = Read-Host "Install Microsoft C++ Build Tools? This is required for Tauri (y/N)"
    if ($confirmation -eq 'y' -or $confirmation -eq 'Y') {
        Write-Host "⬇️  Downloading Visual Studio Build Tools installer..." -ForegroundColor Yellow
        $installerPath = "$env:TEMP\vs_buildtools.exe"
        
        try {
            Invoke-WebRequest -Uri "https://aka.ms/vs/17/release/vs_buildtools.exe" -OutFile $installerPath
            
            Write-Host "🔧 Installing Microsoft C++ Build Tools..." -ForegroundColor Yellow
            Write-Host "   This may take several minutes..." -ForegroundColor Yellow
            
            $process = Start-Process -FilePath $installerPath -ArgumentList "--quiet", "--wait", "--add", "Microsoft.VisualStudio.Workload.VCTools" -PassThru -Wait
            
            if ($process.ExitCode -eq 0) {
                Write-Host "✅ Microsoft C++ Build Tools installed successfully" -ForegroundColor Green
                Remove-Item $installerPath -ErrorAction SilentlyContinue
            } else {
                Write-Host "❌ Failed to install Microsoft C++ Build Tools" -ForegroundColor Red
                Write-Host "📋 Manual installation guide:" -ForegroundColor Yellow
                Write-Host "   1. Download: https://aka.ms/vs/17/release/vs_buildtools.exe"
                Write-Host "   2. Run installer and select 'C++ build tools' workload"
                exit 1
            }
        } catch {
            Write-Host "❌ Failed to download or install Microsoft C++ Build Tools" -ForegroundColor Red
            Write-Host "📋 Manual installation guide:" -ForegroundColor Yellow
            Write-Host "   1. Download: https://aka.ms/vs/17/release/vs_buildtools.exe"
            Write-Host "   2. Run installer and select 'C++ build tools' workload"
            exit 1
        }
    } else {
        Write-Host "❌ Microsoft C++ Build Tools required for Tauri development" -ForegroundColor Red
        Write-Host "📋 Manual installation guide:" -ForegroundColor Yellow
        Write-Host "   1. Download: https://aka.ms/vs/17/release/vs_buildtools.exe"
        Write-Host "   2. Run installer and select 'C++ build tools' workload"
        exit 1
    }
} else {
    Write-Host "✅ Microsoft C++ Build Tools already installed" -ForegroundColor Green
}

# Check if mise is installed
if (-not (Get-Command mise -ErrorAction SilentlyContinue)) {
    Write-Host "📦 Installing mise..." -ForegroundColor Yellow
    
    # Install mise using PowerShell
    irm https://mise.run | iex
    
    # Refresh environment variables
    $env:PATH = [System.Environment]::GetEnvironmentVariable("PATH", "Machine") + ";" + [System.Environment]::GetEnvironmentVariable("PATH", "User")
    
    Write-Host "✅ mise installed successfully" -ForegroundColor Green
} else {
    Write-Host "✅ mise already installed" -ForegroundColor Green
}

# Install tools defined in mise.toml
Write-Host "🔧 Installing development tools..." -ForegroundColor Yellow
mise install

# Install security tools
Write-Host "🔒 Installing security tools..." -ForegroundColor Yellow
mask install-tools

# Verify installation
Write-Host "✅ Verifying installation..." -ForegroundColor Green
mise --version
cargo --version
node --version
mask --version

Write-Host ""
Write-Host "🎉 Bootstrap completed successfully!" -ForegroundColor Green
Write-Host ""
Write-Host "Next steps:" -ForegroundColor Cyan
Write-Host "1. Restart your PowerShell session"
Write-Host "2. Run: mask build"
Write-Host "3. Run: mask dev"
Write-Host ""
Write-Host "Available commands:" -ForegroundColor Cyan
Write-Host "- mask build        # Build the project"
Write-Host "- mask dev          # Run development server"
Write-Host "- mask test         # Run tests"
Write-Host "- mask lint         # Run linter with security checks"
Write-Host "- mask fmt          # Format code"
Write-Host "- mask audit        # Security vulnerability audit"
Write-Host "- mask deny         # Dependency policy checks"
Write-Host "- mask security     # Comprehensive security scan"
Write-Host "- mask spellcheck   # Check spelling in code and docs"
Write-Host "- mask fuzz         # Fuzzing tests"
Write-Host "- mask release      # Create new release"
Write-Host "- mask changelog    # Generate changelog"
Write-Host "- mask commit-check # Verify conventional commits"