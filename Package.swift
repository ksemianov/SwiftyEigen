// swift-tools-version:5.3

import PackageDescription

let package = Package(
    name: "SwiftyEigen",
    products: [
        .library(
            name: "SwiftyEigen",
            targets: ["ObjCEigen", "SwiftyEigen"]
        )
    ],
    dependencies: [],
    targets: [
        .target(
            name: "ObjCEigen",
            path: "Sources/ObjC",
            cxxSettings: [
                .headerSearchPath("../CPP/"),
                .define("EIGEN_MPL2_ONLY")
            ]
        ),
        .target(
            name: "SwiftyEigen",
            dependencies: ["ObjCEigen"],
            path: "Sources/Swift"
        )
    ]
)
