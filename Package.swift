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
            url: "https://github.com/dial9/pjsip-kit/releases/download/1.1.0/PJSIPKit-1.1.0.xcframework.zip",
            checksum: "5d206881b71b49023ffaae86c3a51128ed38ced0fd4f069c1916b0f070211b16"
        )
    ]
)
