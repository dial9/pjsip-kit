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
            url: "https://github.com/dial9/pjsip-kit/releases/download/1.0.1/PJSIPKit-1.0.1.xcframework.zip",
            checksum: "bd23157988934b1c01e9501121253cd52a274ec68a5011e5bee65158e278e49f"
        )
    ]
)
