# SinkChart Architecture

## Overview

SinkChart is designed as a modular, plugin-based map management tool using a vertical slice architecture with selective crate boundaries. The system is built with Rust and uses Tauri + Dioxus for cross-platform deployment.

## High-Level Architecture

```
┌─────────────────────────────────────────────────────────────┐
│                    SinkChart Application                    │
├─────────────────────────────────────────────────────────────┤
│                     Tauri Shell                            │
├─────────────────────────────────────────────────────────────┤
│                    Dioxus UI Layer                          │
├─────────────────────────────────────────────────────────────┤
│  Core Business Logic  │  Plugin System  │  Integrations    │
├─────────────────────────────────────────────────────────────┤
│                   Common Utilities                          │
└─────────────────────────────────────────────────────────────┘
```

## Crate Structure

### Core Crates

- **`sinkchart-core`**: Core business logic, map management, annotation system
- **`sinkchart-ui`**: Dioxus UI components and layout management
- **`sinkchart-tauri-app`**: Tauri application shell and main entry point
- **`sinkchart-common`**: Shared utilities, error handling, configuration

### Extension Crates

- **`sinkchart-plugins`**: Plugin system and dynamic loading
- **`sinkchart-integrations`**: External integrations (export/import, sync)

## Key Design Principles

### 1. Vertical Slice Architecture

Features are organized as vertical slices that cut through all layers:
- Each major feature (maps, annotations, plugins) has its own module
- Minimal horizontal coupling between features
- Clear boundaries and interfaces

### 2. Plugin-Based Extension

- Game-specific functionality implemented as plugins
- Hot-loadable plugins for development
- Standardized plugin API for consistency
- Secure plugin sandboxing

### 3. Cross-Platform Deployment

- Single codebase for desktop, mobile, and web
- Tauri provides native OS integration
- Dioxus enables reactive UI with minimal overhead
- Platform-specific optimizations where needed

### 4. Security-First Design

- AGPLv3 license compliance
- Dependency security scanning
- Minimal attack surface
- Secure plugin isolation

## Data Flow

1. **User Interaction**: User interacts with Dioxus UI components
2. **Event Handling**: UI events are processed by the Tauri shell
3. **Business Logic**: Core logic processes the request
4. **Plugin System**: Plugins extend functionality as needed
5. **Data Storage**: Local storage with optional cloud sync
6. **UI Update**: Reactive UI updates reflect changes

## Development Workflow

1. **Bootstrap**: Use `scripts/bootstrap.sh` or `scripts/bootstrap.ps1`
2. **Development**: Use `mask dev` for development server
3. **Testing**: Use `mask test` for comprehensive testing
4. **Building**: Use `mask build` for production builds
5. **Deployment**: Cross-platform builds via CI/CD

## Technology Stack

- **Language**: Rust (stable)
- **UI Framework**: Dioxus 0.6
- **Desktop Framework**: Tauri 2.0
- **Build System**: Cargo workspace
- **Task Runner**: Mask
- **Tool Management**: mise
- **Security**: cargo-audit, cargo-deny, clippy

## Future Considerations

- WebAssembly support for web deployment
- Mobile app development with Tauri Mobile
- Real-time collaboration features
- Advanced plugin marketplace
- Performance optimization for large maps