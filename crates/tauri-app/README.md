# SinkChart Tauri Application

Desktop application shell that packages SinkChart UI into a native cross-platform application.

## Overview

This crate serves as the main executable for SinkChart's desktop application. 
It integrates the Dioxus UI with Tauri's native capabilities to provide file system access, native menus, and system integration.

## Key Features

- **Native Desktop App**: Cross-platform desktop application (Windows, macOS, Linux)
- **File System Access**: Save and load map files locally
- **System Integration**: Native file dialogs, system notifications
- **Auto-updates**: Built-in update mechanism (when configured)
- **Performance**: Native performance with web technologies

## Building

```bash
# Development mode with hot reload
cargo tauri dev

# Production build
cargo tauri build

# Build for specific platform
cargo tauri build --target x86_64-pc-windows-msvc
```

## Configuration

The application is configured via `tauri.conf.json`:

- **Window Settings**: Default size, minimum size, decorations
- **Security**: CSP policies and allowed APIs
- **Bundle**: App metadata, icons, and signing certificates

## System Requirements

### Linux
- webkit2gtk-4.1
- gtk3
- libayatana-appindicator3

### macOS
- macOS 10.13+
- Xcode Command Line Tools

### Windows
- Windows 7+
- Microsoft C++ Build Tools

## Dependencies

- `tauri` - Desktop application framework
- `sinkchart-ui` - UI components
- `sinkchart-core` - Core functionality
- `anyhow` - Error handling for application logic

This is the main entry point for desktop users of SinkChart.