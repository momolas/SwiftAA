// swift-tools-version:5.9
import PackageDescription

let package = Package(
    name: "SwiftAA",
    defaultLocalization: "en",
    platforms: [
        .macOS(.v10_15),
        .iOS(.v13),
        .tvOS(.v12),
        .watchOS(.v7)
    ],
    products: [
        // The C++ astronomical algorithms library by J.P. Naughter
        .library(name: "AAplus", targets: ["AAplus"]),
        // The C bridge exposing AAplus functions to Swift
        .library(name: "AABridge", targets: ["AABridge"]),
        // The Swift wrapper API on top of the bridge
        .library(name: "SwiftAA", targets: ["SwiftAA"])
    ],
    targets: [
        // MARK: - C++ Core
        .target(
            name: "AAplus",
            path: "Sources/AA+",
            exclude: [
                "AAVSOP2013.h",
                "AAVSOP2013.cpp"
            ],
            publicHeadersPath: ".",
            cxxSettings: [
                .headerSearchPath(".")
            ]
        ),

        // MARK: - C Bridge
        .target(
            name: "AABridge",
            dependencies: ["AAplus"],
            path: "Sources/AABridge",
            publicHeadersPath: "include"
        ),
        .testTarget(
            name: "AABridgeTests",
            dependencies: ["AABridge"]
        ),

        // MARK: - Swift API
        .target(
            name: "SwiftAA",
            dependencies: ["AABridge"],
            path: "Sources/SwiftAA",
            exclude: ["SwiftAA-Info.plist"]
        ),
        .testTarget(
            name: "SwiftAATests",
            dependencies: ["SwiftAA"],
            path: "Tests/SwiftAATests",
            exclude: ["SwiftAATests-Info.plist"]
        )
    ],
    cxxLanguageStandard: .cxx17
)
