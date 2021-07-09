// swift-tools-version:5.3
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
	name: "ReCaptcha",
	platforms: [
		.iOS(.v12)
		],
	products: [
		.library(
			name: "ReCaptcha",
			targets: ["ReCaptcha"]),
	],
	dependencies: [
		 .package(url: "https://github.com/JakubMazur/AppSwizzle.git", from: "1.3.2"),
	],
	targets: [
		.target(
			name: "ReCaptcha",
			path: "ReCaptcha/Classes",
			linkerSettings: [
				.linkedFramework("UIKit")
			]
		),
		.testTarget(
			name: "ReCaptcha_Tests",
			dependencies: ["ReCaptcha", "AppSwizzle"],
			path: "Example/ReCaptcha_Tests",
			exclude: ["Info.plist"],
			resources: [
				.copy("mock.html")
			])
	]
)

