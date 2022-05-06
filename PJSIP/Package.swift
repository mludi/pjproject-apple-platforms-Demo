// swift-tools-version: 5.6
import PackageDescription

let package = Package(
    name: "PJSIP",
    platforms: [
        .macOS(.v12),
        .iOS(.v15)
    ],
    products: [
        .library(name: "PJSIP", targets: ["PJSIP"]),
    ],
    targets: [
        .binaryTarget(name: "libpjproject", path: "libpjproject.xcframework"),
        .systemLibrary(name: "Cpjproject", pkgConfig: "pjproject-apple-platforms-SPM"),
        .target(name: "PJSIP", dependencies: ["Cpjproject","libpjproject"]),
        .testTarget(name: "PJSIPTests", dependencies: ["PJSIP","libpjproject"])
    ]
)
