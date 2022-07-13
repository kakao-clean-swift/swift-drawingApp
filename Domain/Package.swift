// swift-tools-version:5.6
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "Domain",
    platforms: [.iOS(.v15)],
    products: [
        .library(
            name: "Entity",
            targets: ["Entity"]
        ),
        .library(
            name: "UseCase",
            targets: ["UseCase"]
        ),
        .library(
            name: "Util",
            targets: ["Util"]
        ),
    ],
    dependencies: [
        // Dependencies declare other packages that this package depends on.
        // .package(url: /* package url */, from: "1.0.0"),
    ],
    targets: [
        .target(
            name: "Entity",
            dependencies: ["Util"]
        ),
        .target(
            name: "UseCase",
            dependencies: ["Entity"]
        ),
        .target(name: "Util"),
        .testTarget(
            name: "EntityTests",
            dependencies: ["Entity"]
        ),
        .testTarget(
            name: "UseCaseTests",
            dependencies: ["UseCase"]
        ),
        .testTarget(
            name: "UtilTests",
            dependencies: ["Util"]
        )
    ]
)
