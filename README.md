# WebTypes, as used in [gnorium.com](https://gnorium.com)

Shared web types and design tokens for Swift web development.

## Overview

WebTypes provides common type definitions and design tokens used across Swift web packages, ensuring consistency in styling and behavior.

## Features

- **Design Tokens**: Colors, spacing, typography
- **Shared Types**: Common web-related type definitions
- **Type Safety**: Compile-time guarantees for web values

## Installation

### Swift Package Manager

Add WebTypes to your `Package.swift`:

```swift
dependencies: [
    .package(url: "https://github.com/gnorium/web-types", branch: "main")
]
```

Then add it to your target dependencies:

```swift
.target(
    name: "YourTarget",
    dependencies: [
        .product(name: "WebTypes", package: "web-types")
    ]
)
```

## Usage

```swift
import WebTypes

// Use shared design tokens
let primaryColor = Color.primary
let standardSpacing = Spacing.medium
```

## Requirements

- Swift 6.2+

## License

Apache License 2.0 - See [LICENSE](LICENSE) for details

## Contributing

Contributions welcome! Please open an issue or submit a pull request.

## Related Packages

- [design-tokens](https://github.com/gnorium/design-tokens) - Universal design tokens based on Apple HIG
- [embedded-swift-utilities](https://github.com/gnorium/embedded-swift-utilities) - Utility functions for Embedded Swift environments
- [markdown-utilities](https://github.com/gnorium/markdown-utilities) - Markdown rendering with media attribution support
- [admin-core](https://github.com/gnorium/admin-core) - Core admin functionalities for web applications
- [web-apis](https://github.com/gnorium/web-apis) - Web API implementations for Swift WebAssembly
- [web-builders](https://github.com/gnorium/web-builders) - HTML, CSS, JS, and SVG DSL builders
- [web-components](https://github.com/gnorium/web-components) - Reusable UI components for web applications
- [web-formats](https://github.com/gnorium/web-formats) - Structured data format builders
- [web-security](https://github.com/gnorium/web-security) - Portable security utilities for web applications
