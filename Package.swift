// swift-tools-version: 5.9
import PackageDescription

let package = Package(
    name: "PJSIPKit",
    platforms: [.iOS(.v16)],
    products: [
        .library(name: "PJSIPKit", targets: ["PJSIPKit", "PJSIPKitLinker"])
    ],
    targets: [
        .target(
            name: "PJSIPKitLinker",
            dependencies: ["PJSIPKit"],
            path: "Sources/PJSIPKitLinker",
            publicHeadersPath: "include",
            linkerSettings: [
                .linkedFramework("AudioToolbox"),
                .linkedFramework("AVFoundation"),
                .linkedFramework("CoreAudio"),
                .linkedFramework("CFNetwork"),
                .linkedFramework("Network"),
                .linkedFramework("Security"),
                .linkedLibrary("c++"),
            ]
        ),
        .binaryTarget(
            name: "PJSIPKit",
            url: "https://github.com/dial9/pjsip-kit/releases/download/1.1.1/PJSIPKit-1.1.1.xcframework.zip",
            checksum: "ce5c08d8d2596f20380c6ae815b5899b650f9b717949ae7798440f1af5a2c337"
        )
    ]
)
