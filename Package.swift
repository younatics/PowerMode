// swift-tools-version:6.0
import PackageDescription

let package = Package(
    name: "PowerMode",
    platforms: [
        .iOS(.v13)
    ],
    products: [
        .library(name: "PowerMode", targets: ["PowerMode"])
    ],
    targets: [
        .target(
            name: "PowerMode",
            path: "PowerMode",
            exclude: [
                "PowerMode.h",
                "Info.plist"
            ],
            swiftSettings: [
                .swiftLanguageMode(.v6)
            ]
        ),
        .testTarget(
            name: "PowerModeTests",
            dependencies: ["PowerMode"],
            path: "Tests/PowerModeTests",
            swiftSettings: [
                .swiftLanguageMode(.v6)
            ]
        )
    ]
)
