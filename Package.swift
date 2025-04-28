// swift-tools-version:5.6

import PackageDescription

let package = Package(
    name: "Sencha",
    platforms: [.iOS("13.0")],
    products: [
        .library(name: "Sencha", targets: ["Sencha"])
    ],
    dependencies: [
        .package(
            url: "https://github.com/kif-framework/KIF.git",
            .upToNextMajor(from: "3.0.0")
        )
    ],
    targets: [
        .target(
            name: "Sencha",
            dependencies: [
                .product(name: "KIF", package: "KIF"),
            ],
            path: "Sencha/"
        )
    ]
)
