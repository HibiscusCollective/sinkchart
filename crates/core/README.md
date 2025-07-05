# SinkChart Core

The foundational library providing core data structures and business logic for SinkChart.

## Overview

This crate contains the essential types and functionality that all other SinkChart components depend on. It defines the fundamental concepts of maps, annotations, and plugins without any UI or platform-specific dependencies.

## Key Components

- **Map Management**: Core map data structures and operations
- **Annotation System**: Pin types, notes, and custom markers
- **Plugin Architecture**: Plugin trait definitions and loading mechanisms
- **Data Serialization**: Lightweight file format for map data

## Usage

```rust
use sinkchart_core::{Map, Annotation, Plugin};

// Create a new map
let map = Map::new("Game World", 1920, 1080);

// Add annotations
let annotation = Annotation::new_pin(100, 200, "Treasure Location");
map.add_annotation(annotation);
```

## Design Principles

- **Pure Rust**: No external runtime dependencies
- **Serializable**: All types implement serde traits
- **Plugin-Ready**: Extensible architecture for game-specific features
- **Performance**: Optimized for real-time map operations

## Dependencies

- `serde` - Serialization/deserialization
- `thiserror` - Error handling

This crate is designed to be the stable foundation that other crates build upon.