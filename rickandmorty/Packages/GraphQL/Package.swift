// swift-tools-version: 5.10
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "GraphQL",
    platforms: [
        .iOS(.v17)
    ],
    products: [
        // Products define the executables and libraries a package produces, making them visible to other packages.
        .library(
            name: "GraphQL",
            targets: ["GraphQL"]),
    ],
    dependencies: [
        .package(url: "https://github.com/apollographql/apollo-ios.git", exact: "1.15.1")
    ],
    targets: [
        // Targets are the basic building blocks of a package, defining a module or a test suite.
        // Targets can depend on other targets in this package and products from dependencies.
        .target(
            name: "GraphQL",
        dependencies: [
            .product(name: "Apollo", package: "apollo-ios"),
        ]),
        .testTarget(
            name: "GraphQLTests",
            dependencies: [
                "GraphQL",
                .product(name: "ApolloTestSupport", package: "apollo-ios")
            ]),
    ]
)
