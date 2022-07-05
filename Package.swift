// swift-tools-version: 5.4
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
	name: "InlineLocalization",
	platforms: [
		.macOS(.v11),
		.iOS(.v14),
	],
	products: [
		.library(
			name: "InlineLocalization",
			targets: ["InlineLocalization", "InlineLocalizationUI"]
		),
	],
	dependencies: [
		// .package(url: /* package url */, from: "1.0.0"),
	],
	targets: [
		.target(
			name: "InlineLocalization",
			dependencies: []
		),
		.target(
			name: "InlineLocalizationUI",
			dependencies: ["InlineLocalization"]
		),
		.testTarget(
			name: "InlineLocalizationTests",
			dependencies: ["InlineLocalization"]
		),
	]
)
