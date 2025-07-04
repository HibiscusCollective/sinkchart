# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Project Overview

SinkChart is a plugin-based map management tool designed specifically for video game exploration. It is an alternative to pre-populated maps that spoil the exploration experience.
It enables players to create, annotate and share game maps with unprecedented ease and precision. The platform addresses a critical gap in the gaming ecosystem by providing a clean, 
intuitive interface where players can load blank game maps and enhance them with custom pins, detailed notes, and strategic annotations that can be saved locally and shared with others using a lightweight file format. 

The core strength of SinkChart lies in its modular, plugin-based architecture that allows game-specific customization while maintaining a unified user experience across all supported titles.
Each plugin can provide base maps for specific games along with tailored annotation types—whether that's marking loot spawns in survival games, 
documenting raid strategies in MMORPGs, or sharing exploration discoveries in open-world adventures. 
This approach ensures that SinkChart scales organically with the gaming community's needs while providing developers and content creators with the flexibility to extend functionality for emerging games and evolving player requirements.

## Current State

- Empty repository with only git and Claude configuration
- No package.json, dependencies, or build system configured
- No source code files present
- Contains Claude Code permissions configuration allowing bash operations

## Technical vision

- Single-command bootstrap across Windows, macOS, and Linux
- Minimal toolchain with carefully selected, essential tools
- Security and privacy first approach
- Reproducible builds with locked dependencies and consistent environments
- Modular expansion allowing incremental feature addition
- Great developer experience with modern tooling and best practices
- Up-to-date documentation both for end users and developers

## Core Dependencies

- Rust Ecosystem:
    - rustc + cargo (via rustup)
    - clippy - Rust linter with security-focused rules
    - rustfmt - Code formatting
    - cross - Cross-compilation support
    - tauri - Cross-platform GUI framework
    - dioxus - UI framework for tauri
- Build and Task Management:
    - mask - Primary task runner (markdown-based)
    - just - Backup task runner for complex scenarios
    - mise - environment variable management and tooling management
- Security Tools:
    - cargo-audit - Security vulnerability scanning
    - cargo-deny - Dependency management and licensing checks
    - cargo-fuzz - for fuzzing
    - clippy security lints - Enhanced with custom security rules
    - opengrep - Supports Rust with customizable security rules
    - deepsource - Rust analyzer with 50+ issue types including security
    - trivy
    - GitHub Advanced Security “Code Scanning”
- Build and release tools:
    - CI/CD with GitHub Actions
    - Coccogitto - Conventional commits and conventional changelogs release automation
    - Coderabbit - Automated code review and linters
- Documentation
    - Cargo Docs for API docs
    - mdbook for user docs

## Testing

- Unit Testing: Built-in Rust testing + proptest + quickcheck
- Integration Testing: testcontainers for database testsf
- Performance Testing: criterion for benchmarking
- E2E/UI Testing: Unknown? Patrol?

## Logging and Monitoring

- Structured Logging: tracing ecosystem
- Error Handling: anyhow or eyre
- Metrics: metrics crate with exporters
- Opt-in Telemetry: Unknown / Manual crash reporting

## Documentation

- API Docs: cargo doc with custom styling
- User Docs: `mdbook` for comprehensive guides
- Architecture Decisions: ADR template in docs/

## CI/CD Integration

- GitHub Actions workflows for multi-platform builds
- Security scanning integration with cargo-audit
- Automated testing across all supported platforms

## Architecture Overview

SinkChart is a sophisticated plugin-based map management tool requiring:

- Cross-platform deployment: Desktop, mobile, and web targets using Tauri 2.0 + Dioxus Tauri
- Modular architecture: Modular organization with selective crate boundaries
- Vertical slice architecture: Feature-based organization with selective crate boundaries 
- Security-first approach: Comprehensive security tooling and AGPLv3 compliance
- Modern tooling: mise.toml, Mask task runner, Go 1.24+ helpers, and automated CI/CD

## Implementation Strategy

The implementation follows a depth-first approach with multiple specialized perspectives addressing different architectural concerns. 
Each prompt builds upon previous work while maintaining clear separation of concerns.

## Key Success Factors

- Technical Excellence: Modern Rust workspace with Tauri 2.0 + Dioxus 0.6 integration, vertical slice architecture, and comprehensive security tooling.
- User Experience: Easy-to-use interface with a focus on simplicity and accessibility.
- Efficiency: Fast and efficient code execution allowing for seamless use on a second screen without impacting the game experience.
- Libre Software Compliance: Full AGPLv3 compliance with proper source code availability, comprehensive documentation, and dependency license management.
- Developer Experience: Modern tooling with mise.toml, Mask task runner, automated CI/CD, and comprehensive documentation.
- Security-First: Security scanning automation, vulnerability management, and secure development practices throughout the entire architecture.
- Privacy protection: User privacy and data protection measures, exclusively opt-in telemetry, always anonymized and securely stored.
