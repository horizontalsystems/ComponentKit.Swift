// swift-tools-version:5.5

import PackageDescription

let package = Package(
    name: "ComponentKit",
    defaultLocalization: "en",
    platforms: [
        .iOS(.v13),
    ],
    products: [
        .library(
            name: "ComponentKit",
            targets: ["ComponentKit"]),
    ],
    dependencies: [
        .package(url: "https://github.com/horizontalsystems/UIExtensions.git", .upToNextMajor(from: "1.1.1")),
        .package(url: "https://github.com/horizontalsystems/ThemeKit.git", .upToNextMajor(from: "1.0.0")),
        .package(url: "https://github.com/horizontalsystems/HUD.git", .upToNextMajor(from: "1.2.0")),
        .package(url: "https://github.com/horizontalsystems/SectionsTableView.git", .upToNextMajor(from: "1.1.1")),
        .package(url: "https://github.com/horizontalsystems/LanguageKit.git", .upToNextMajor(from: "1.0.0")),
        .package(url: "https://github.com/SnapKit/SnapKit.git", .upToNextMajor(from: "5.0.1")),
        .package(url: "https://github.com/Juanpe/SkeletonView.git", from: "1.7.0")
    ],
    targets: [
        .target(
            name: "ComponentKit",
            dependencies: ["UIExtensions", "ThemeKit", "HUD", "SectionsTableView", "LanguageKit", "SnapKit", "SkeletonView"]),
    ]
)
