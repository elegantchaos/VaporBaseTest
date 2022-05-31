// swift-tools-version:5.5

// -=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
//  Created by Sam Deane on 31/05/2022.
//  All code (c) 2022 - present day, Sam Deane.
// -=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-

import PackageDescription

let package = Package(
    name: "VaporBaseTest",
    
    platforms: [
        .macOS(.v12)
    ],
    
    products: [
        .executable(
            name: "web",
            targets: ["VaporBaseTest"]
        ),
    ],
    
    dependencies: [
        .package(url: "https://github.com/elegantchaos/VaporBase.git", from: "1.0.0"),
        .package(url: "https://github.com/elegantchaos/XCTestExtensions.git", from: "1.4.2")
    ],
    
    targets: [
        .executableTarget(
            name: "VaporBaseTest",
            dependencies: [
                .product(name: "VaporBase", package: "VaporBase")
            ],
            resources: [
                .copy("Resources/Views")
            ]
        ),
    ]
)
