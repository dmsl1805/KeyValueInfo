// swift-tools-version:5.3
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "KeyValueInfo",
    products: [
        .library(
            name: "KeyValueInfo",
            targets: ["KeyValueInfo"]
        ),
        .library(
            name: "KeyValueInfo-UIKit",
            targets: ["KeyValueInfo-UserDefaults"]
        ),
        .library(
            name: "KeyValueInfo-UserDefaults",
            targets: ["KeyValueInfo-UserDefaults"]
        ),
    ],
    dependencies: [
        .package(url: "https://github.com/mattgallagher/CwlPreconditionTesting.git", from: Version("2.0.0-beta.1"))
    ],
    targets: [
        .target(
            name: "KeyValueInfo",
            dependencies: []
        ),
        .target(
            name: "KeyValueInfo-UIKit",
            dependencies: [
                "KeyValueInfo"
            ]
        ),
        .target(
            name: "KeyValueInfo-UserDefaults",
            dependencies: [
                "KeyValueInfo"
            ]
        ),
        .testTarget(
            name: "KeyValueInfoTests",
            dependencies: [
                "KeyValueInfo-UserDefaults",
                "KeyValueInfo-UIKit",

                "CwlPreconditionTesting"
            ]
        ),
    ]
)
