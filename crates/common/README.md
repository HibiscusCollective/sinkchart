# SinkChart Common

Shared utilities, configuration management, and common functionality used across all SinkChart crates.

## Overview

This crate provides the foundational utilities that other crates depend on, including configuration management, error handling utilities, logging setup, and shared helper functions.

## Key Components

- **Configuration**: Application and user settings management
- **Error Handling**: Common error types and utilities
- **Utilities**: Helper functions for common operations
- **Logging**: Structured logging configuration

## Configuration Management

```rust
use sinkchart_common::Config;

// Load configuration from file or defaults
let config = Config::load()?;

// Access settings
println!("Theme: {}", config.ui.theme);
println!("Auto-save: {}", config.general.auto_save);

// Update and save configuration
config.ui.theme = Theme::Dark;
config.save()?;
```

## Error Handling

```rust
use sinkchart_common::{Result, Error};

fn example_function() -> Result<String> {
    // Common error handling patterns
    let data = load_file("config.json")
        .map_err(Error::ConfigLoad)?;
    
    Ok(data)
}
```

## Utilities

```rust
use sinkchart_common::utils::{ensure_dir, format_file_size};

// Ensure directory exists
ensure_dir("~/.sinkchart/maps")?;

// Format file sizes
let size_str = format_file_size(1024 * 1024); // "1.0 MB"
```

## Features

- **Cross-platform**: Path handling that works on all platforms
- **Async Ready**: Utilities work with both sync and async code
- **Configurable**: Flexible configuration system with defaults
- **Type Safe**: Strong typing for all configuration options

## Dependencies

- `serde` - Serialization for configuration
- `thiserror` - Structured error types
- `tracing` - Structured logging

This crate ensures consistency and reduces code duplication across the SinkChart ecosystem.