// swift-tools-version:5.1

/**
*  Ink
*  Copyright (c) John Sundell 2019
*  MIT license, see LICENSE file for details
*/

import PackageDescription

let package = Package(
    name: "Ink",
    platforms: [
        .iOS(SupportedPlatform.IOSVersion.v13)
    ],
    products: [
        .library(name: "Ink", targets: ["Ink"]),
        .executable(name: "ink-cli", targets: ["InkCLI"])
    ],
    targets: [
        .target(name: "Ink"),
        .target(name: "InkCLI", dependencies: ["Ink"]),
        .testTarget(name: "InkTests", dependencies: ["Ink"])
    ]
    
)
