# PJSIPKit

`PJSIPKit` is the distributed Swift Package for Dial 9’s iOS build of [PJSIP](https://www.pjsip.org/).

This repository is intentionally minimal: it publishes the Swift Package manifest and the GitHub Release assets needed for Swift Package Manager to fetch the packaged XCFramework.

## Install

Add `PJSIPKit` as a Swift Package dependency:

```swift
dependencies: [
    .package(url: "https://github.com/dial9/pjsip-kit.git", from: "1.0.0")
]
```

Then add the product to your target:

```swift
.product(name: "PJSIPKit", package: "pjsip-kit")
```

Import it in Swift:

```swift
import PJSIPKit
```

## How It Works

Each published version of `PJSIPKit` consists of:

- a tagged Swift Package manifest commit
- a GitHub Release containing:
  - `PJSIPKit-<version>.xcframework.zip`
  - `PJSIPKit-<version>.xcframework.zip.sha256`

Swift Package Manager reads `Package.swift` from the tagged commit and downloads the matching XCFramework from the corresponding GitHub Release.

## Repository Layout

This repository keeps its package history small on purpose.

Published package commits contain only the files SwiftPM needs:

- `Package.swift`
- `Sources/PJSIPKitLinker/shim.c`

The actual binary framework is distributed as a release asset, not committed into Git history.

## Versioning

Use tagged releases in production.

Recommended:

```swift
.package(url: "https://github.com/dial9/pjsip-kit.git", from: "1.0.0")
```

Pinned exactly:

```swift
.package(url: "https://github.com/dial9/pjsip-kit.git", exact: "1.0.0")
```

Branch-based dependencies are not recommended for normal app consumption because they track a moving target.

## Branches

- `main`: documentation and repo landing page
- `release`: package history for published versions

Published versions are identified by Git tags such as `1.0.0`.

## Source of Truth

This repository is published by the Dial 9 build pipeline:

- Builder repo: [dial9/ios-pjsip-builder](https://github.com/dial9/ios-pjsip-builder)

That repository downloads upstream PJSIP, builds the iOS artifacts, packages the XCFramework, and publishes releases here.

## License

PJSIP and any bundled native dependencies are subject to their own upstream license terms. Review those licenses before redistribution or commercial use.