// swift-tools-version:5.9
import PackageDescription

let package = Package(
    name: "Nimble",
    platforms: [
      .macOS(.v10_13), .iOS(.v12), .tvOS(.v12)
    ],
    products: [
        .library(name: "Nimble", targets: ["Nimble"]),
    ],
    dependencies: [
        .package(url: "https://github.com/mattgallagher/CwlPreconditionTesting.git", .upToNextMajor(from: "2.0.0")),
    ],
    targets: [
        .target(
            name: "Nimble",
            dependencies: {
                return [
                    .product(
                        name: "CwlPreconditionTesting",
                        package: "CwlPreconditionTesting",
                        condition: .when(platforms: [.macOS])
                    ),
                    .product(
                        name: "CwlPosixPreconditionTesting",
                        package: "CwlPreconditionTesting",
                        condition: .when(platforms: [.macOS])
                    )
                ]
            }()
        ),
        .testTarget(
            name: "NimbleTests", 
            dependencies: ["Nimble"], 
            exclude: ["objc"]
        ),
    ],
    swiftLanguageVersions: [.v5]
)
