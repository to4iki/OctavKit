import PackageDescription

let package = Package(
    name: "OctavKit",
    dependencies: [
        .Package(url: "https://github.com/ikesyo/Himotoki.git", majorVersion: 3),
        .Package(url: "https://github.com/antitypical/Result.git", majorVersion: 3)
    ],
    swiftLanguageVersions: [3]
)
