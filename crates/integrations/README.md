# SinkChart Integrations

External service integrations for importing, exporting, and synchronizing map data with third-party services.

## Overview

This crate handles all external integrations, allowing SinkChart to work with popular gaming platforms, map sharing services, and cloud storage providers while maintaining user privacy and data control.

## Key Components

- **Export System**: Convert maps to various formats (PNG, SVG, JSON)
- **Import System**: Load maps from external sources and formats
- **Sync Services**: Optional cloud synchronization (always opt-in)
- **Gaming Platforms**: Integration with Steam, Discord, etc. (when available)

## Export Formats

```rust
use sinkchart_integrations::export::{Exporter, ExportFormat};

let exporter = Exporter::new();

// Export as image
exporter.export_image(&map, "map.png", ExportFormat::PNG)?;

// Export as JSON for sharing
exporter.export_data(&map, "map.json", ExportFormat::JSON)?;

// Export as SVG for web
exporter.export_vector(&map, "map.svg", ExportFormat::SVG)?;
```

## Import Sources

```rust
use sinkchart_integrations::import::{Importer, ImportSource};

let importer = Importer::new();

// Import from community maps
let map = importer.from_url("https://maps.example.com/game/123")?;

// Import from local file
let map = importer.from_file("shared_map.json")?;
```

## Privacy-First Design

- **Opt-in Only**: All external connections require explicit user consent
- **Local First**: All data stored locally by default
- **Minimal Data**: Only essential data is shared when syncing
- **User Control**: Users can delete cloud data at any time

## Supported Integrations

### Export Formats
- PNG/JPEG images with annotations
- SVG vector graphics
- JSON data format for sharing
- PDF for printing

### Import Sources
- SinkChart JSON format
- Community map repositories
- Game-specific map formats (via plugins)
- Image files with metadata

### Cloud Services (Optional)
- Generic cloud storage (user's choice)
- Self-hosted sync servers
- Peer-to-peer sharing

## Configuration

```rust
use sinkchart_integrations::Config;

let config = Config {
    enable_cloud_sync: false,  // Disabled by default
    export_quality: ExportQuality::High,
    compression: true,
};
```

## Dependencies

- `reqwest` - HTTP client for web services
- `image` - Image processing for exports
- `sinkchart-core` - Core data types
- `tokio` - Async runtime for network operations

This crate extends SinkChart's capabilities while maintaining strict privacy standards.