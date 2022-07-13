// swift-tools-version: 5.6
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "Data",
    platforms: [.iOS(.v15)],
    products: [
        .library(
            name: "Repository",
            targets: ["Repository"]
        ),
        .library(
            name: "Network",
            targets: ["Network"]
        )
    ],
    dependencies: [
        .package(path: "../Domain")
    ],
    targets: [
        .target(
            name: "Repository",
            dependencies: [
                .product(name: "UseCase", package: "Domain")
            ]
        ),
        .target(
            name: "Network",
            dependencies: [
                .product(name: "UseCase", package: "Domain")
            ]
        ),
        .testTarget(
            name: "RepositoryTests",
            dependencies: ["Repository"]
        ),
        .testTarget(
            name: "NetworkTests",
            dependencies: ["Network"]
        )
    ]
)
