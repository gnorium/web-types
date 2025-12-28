// swift-tools-version: 6.2

import PackageDescription

let package = Package(
    name: "web-types",
    platforms: [
        .macOS(.v14),
        .iOS(.v17),
        .watchOS(.v10),
        .tvOS(.v17),
        .visionOS(.v1)
    ],
    products: [
        .library(
            name: "WebTypes",
            targets: ["WebTypes"]
        ),
    ],
    dependencies: [
        .package(url: "https://github.com/gnorium/embedded-swift-utilities", branch: "main")
    ],
    targets: [
        .target(
            name: "WebTypes",
            dependencies: [
                .product(name: "EmbeddedSwiftUtilities", package: "embedded-swift-utilities")
            ],
            swiftSettings: [
                .enableUpcomingFeature("ExistentialAny"),
                .enableUpcomingFeature("StrictConcurrency")
            ]
        ),
        .testTarget(
            name: "WebTypesTests",
            dependencies: ["WebTypes"]
        ),
    ]
)
