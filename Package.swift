// swift-tools-version: 6.0

import PackageDescription

let package = Package(
    name: "WebTypes",
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
        .package(url: "https://github.com/gnorium/embedded-swift-utilities", from: "1.0.0")
    ],
    targets: [
        .target(
            name: "WebTypes",
            dependencies: [
                .product(name: "Utilities", package: "embedded-swift-utilities")
            ],
            swiftSettings: [
                .enableUpcomingFeature("BareSlashRegexLiterals"),
                .enableUpcomingFeature("ConciseMagicFile"),
                .enableUpcomingFeature("ExistentialAny"),
                .enableUpcomingFeature("ForwardTrailingClosures"),
                .enableUpcomingFeature("ImplicitOpenExistentials"),
                .enableUpcomingFeature("StrictConcurrency"),
                .unsafeFlags(["-warn-concurrency"], .when(configuration: .debug)),
            ]
        ),
        .testTarget(
            name: "WebTypesTests",
            dependencies: ["WebTypes"]
        ),
    ]
)
