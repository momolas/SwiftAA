// swift-tools-version:5.10
import PackageDescription

let package = Package(
    name: "SwiftAA",
    defaultLocalization: "en",
    platforms: [
        .macOS(.v14),
        .iOS(.v17),
        .tvOS(.v17),
        .watchOS(.v10)
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
                "naughter.css",
                "CMakeLists.txt",
                "AA+.htm",
                "AAVSOP2013.h",
                "AAVSOP2013.cpp",
                "AATest.cpp"
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
