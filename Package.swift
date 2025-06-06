// swift-tools-version: 5.9

import PackageDescription

let package = Package(
    name: "SuiKit",
    platforms: [.iOS(.v17), .macOS(.v11), .watchOS(.v10), .tvOS(.v17)],
    products: [
        .library(
            name: "SuiKit",
            targets: ["SuiKit"]),
    ],
    dependencies: [
        .package(url: "https://github.com/MarcoDotIO/UInt256.git", from: "1.0.0"),
        .package(url: "https://github.com/pebble8888/ed25519swift.git", from: "1.2.7"),
        .package(url: "https://github.com/SwiftyJSON/SwiftyJSON.git", from: "4.0.0"),
        .package(url: "https://github.com/tesseract-one/Blake2.swift.git", from: "0.2.0"),
        .package(url: "https://github.com/kolyuchiy/AnyCodable", branch: "add-sendable"),
        .package(url: "https://github.com/tesseract-one/Bip39.swift.git", from: "0.1.1"),
        .package(url: "https://github.com/auth0/JWTDecode.swift", from: "3.1.0"),
        .package(url: "https://github.com/attaswift/BigInt.git", from: "5.3.0"),
        .package(url: "https://github.com/apollographql/apollo-ios.git", exact: "1.17.0")
    ],
    targets: [
        .target(
            name: "secp256k1sui",
            path: "Sources/secp256k1sui",
            publicHeadersPath: "include"
        ),
        .target(
            name: "SuiKit",
            dependencies: [
                .product(name: "BigInt", package: "BigInt"),
                .product(name: "UInt256", package: "UInt256"),
                .product(name: "ed25519swift", package: "ed25519swift"),
                .product(name: "SwiftyJSON", package: "swiftyjson"),
                .product(name: "Blake2", package: "Blake2.swift"),
                .product(name: "AnyCodable", package: "AnyCodable"),
                .product(name: "Bip39", package: "Bip39.swift"),
                .product(name: "JWTDecode", package: "JWTDecode.swift"),
                .product(name: "Apollo", package: "apollo-ios"),
                "secp256k1sui"
            ]
        ),
        .testTarget(
            name: "SuiKitTests",
            dependencies: ["SuiKit"],
            path: "Tests",
            resources: [
                .copy("Resources/coin-metadata.json"),
                .copy("Resources/display-test.json"),
                .copy("Resources/dynamic-fields.json"),
                .copy("Resources/entry-point-types.json"),
                .copy("Resources/entry-point-vector.json"),
                .copy("Resources/hero.json"),
                .copy("Resources/id-entry-args.json"),
                .copy("Resources/kiosk.json"),
                .copy("Resources/serializer.json"),
                .copy("Resources/serializer-upgrade.json")
            ]
        ),
    ]
)
