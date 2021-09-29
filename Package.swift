// swift-tools-version:5.3

import PackageDescription

let package = Package(
  name: "Uppy",
  platforms: [.iOS(.v10)],
  products: [
    .library(
      name: "Uppy",
      targets: ["Uppy"]),
  ],
  dependencies: [
    .package(url: "git@github.com:AliSoftware/OHHTTPStubs.git", .exact("9.1.0"))
  ],
  targets: [
    .target(
      name: "Uppy",
      dependencies: [],
      resources: [.process("Resources")]),
    .testTarget(
      name: "UppyTests",
      dependencies: [
        "Uppy",
        .product(name: "OHHTTPStubs", package: "OHHTTPStubs"),
        .product(name: "OHHTTPStubsSwift", package: "OHHTTPStubs")
      ],
      resources: [.process("Resources")])
  ]
)
