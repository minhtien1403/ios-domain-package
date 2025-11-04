// swift-tools-version: 5.9
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "Domain",
    platforms: [
        .iOS(.v15)
    ],
    products: [
        .library(
            name: "Domain",
            targets: ["Domain"]
        ),
    ],
    dependencies: [
        // Remote Shared Package
        .package(
            url: "https://github.com/minhtien1403/ios-data-package",
            branch: "master"
        )
    ],
    targets: [
        .target(
            name: "Domain",
            dependencies: [
                .product(name: "Data", package: "ios-data-package")
            ],
            path: "Sources/Domain"
        ),
        .testTarget(
            name: "DomainTests",
            dependencies: ["Domain"],
            path: "Tests/DomainTests"
        )
    ]
)
