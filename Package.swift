// swift-tools-version: 5.6
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
  name: "XamKit",
  platforms: [.iOS(.v12)],
  products: [
    // Products define the executables and libraries a package produces, and make them visible to other packages.
    .library(
      name: "XamKit",
      targets: ["XamKit"]
    ),
  ],
  dependencies: [
    .package(url: "https://github.com/SnapKit/SnapKit.git", .upToNextMajor(from: "5.0.1")),
    .package(url: "https://github.com/Alamofire/Alamofire.git", .upToNextMajor(from: "5.5.0")),
    .package(url: "https://github.com/ReactiveX/RxSwift.git", from: "6.5.0")
  ],
  targets: [
    // Targets are the basic building blocks of a package. A target can define a module or a test suite.
    // Targets can depend on other targets in this package, and on products in packages this package depends on.
    .target(
      name: "XamKit",
      dependencies: [
        "SnapKit",
        "Alamofire",
        .product(name: "RxSwift", package: "RxSwift"),
        .product(name: "RxCocoa", package: "RxSwift"),
        .product(name: "RxRelay", package: "RxSwift"),
      ],
      path: "Sources"
    ),
    .testTarget(
      name: "XamKitTests",
      dependencies: ["XamKit"]
    ),
  ]
)
