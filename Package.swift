// swift-tools-version:5.4

import PackageDescription

let package = Package(
    name: "IntrospectionKit",
    products: [
        .library(
            name: "IntrospectionKit",
            targets: ["IntrospectionKit"]
        ),
    ],
    targets: [
        .target(
            name: "IntrospectionKit"
        ),
        .testTarget(
            name: "IntrospectionKit-Test",
            dependencies: [
                "IntrospectionKit"
            ]
        )
    ]
)
