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
            url: "https://github.com/dial9/pjsip-kit/releases/download/1.1.2/PJSIPKit-1.1.2.xcframework.zip",
            checksum: "44b9b41128ca55917a6dcfabf6b324eda06b1607fcf0cd2890b0263c6d4c7c5e"
        )
    ]
)
