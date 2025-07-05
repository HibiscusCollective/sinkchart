# SinkChart UI

Cross-platform user interface components built with Dioxus for SinkChart applications.

## Overview

This crate provides reusable UI components and layouts that can be used across desktop, web, and mobile platforms. It implements the visual layer of SinkChart using modern reactive patterns.

## Key Components

- **Map Renderer**: Interactive map display with zoom and pan
- **Annotation Tools**: UI for creating and editing pins and notes
- **Theme System**: Consistent styling across platforms
- **Layout Components**: Responsive layouts for different screen sizes

## Usage

```rust
use dioxus::prelude::*;
use sinkchart_ui::{MapView, AnnotationPanel, ThemeProvider};

#[component]
fn app() -> Element {
    rsx! {
        ThemeProvider {
            MapView {
                map: use_signal(|| Map::default()),
                annotations: use_signal(|| vec![])
            }
            AnnotationPanel {
                on_add_annotation: |annotation| {
                    // Handle new annotation
                }
            }
        }
    }
}
```

## Features

- **Responsive Design**: Adapts to different screen sizes and orientations
- **Touch Support**: Optimized for both mouse and touch interactions
- **Accessibility**: ARIA labels and keyboard navigation support
- **Theming**: Light/dark mode with customizable colors

## Platform Support

- Desktop (via Tauri)
- Web browsers
- Mobile (future support)

## Dependencies

- `dioxus` - Reactive UI framework
- `sinkchart-core` - Core data types
- `serde` - State serialization