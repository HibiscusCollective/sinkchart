# SinkChart Plugins

Plugin system for extending SinkChart with game-specific functionality and custom annotation types.

## Overview

This crate implements SinkChart's plugin architecture, allowing developers to create game-specific extensions that provide custom maps, annotation types, and specialized features without modifying the core application.

## Key Components

- **Plugin API**: Trait definitions for creating plugins
- **Plugin Loader**: Dynamic loading and management of plugins
- **Plugin Registry**: Discovery and registration of available plugins
- **Type System**: Extension points for custom annotation types

## Creating a Plugin

```rust
use sinkchart_plugins::{Plugin, PluginResult, GamePlugin};

pub struct MyGamePlugin;

impl Plugin for MyGamePlugin {
    fn name(&self) -> &str { "My Game" }
    fn version(&self) -> &str { "1.0.0" }
    
    fn load(&mut self) -> PluginResult<()> {
        // Initialize plugin resources
        Ok(())
    }
    
    fn annotation_types(&self) -> Vec<AnnotationType> {
        vec![
            AnnotationType::new("loot_chest", "Loot Chest"),
            AnnotationType::new("boss_spawn", "Boss Spawn Point"),
        ]
    }
}
```

## Plugin Structure

```
my-game-plugin/
├── Cargo.toml
├── src/
│   ├── lib.rs          # Plugin implementation
│   ├── annotations.rs  # Custom annotation types
│   └── maps.rs         # Game map definitions
└── assets/
    ├── icons/          # Custom icons
    └── maps/           # Base map images
```

## Loading Plugins

Plugins can be loaded from:
- **Built-in**: Compiled into the application
- **Dynamic**: Loaded from shared libraries (.dll/.so/.dylib)
- **Directory**: Auto-discovered from plugins folder

## Security Considerations

- Plugins run with the same permissions as the main application
- Use trusted sources only for dynamic plugins
- Consider sandboxing for untrusted plugins (future feature)

## Dependencies

- `libloading` - Dynamic library loading
- `sinkchart-core` - Core types and traits
- `thiserror` - Error handling