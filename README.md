# OctavKit
[![Carthage compatible][carthage-image]][carthage-url]

Swift toolkit for the Octav API.

## Requirements
- Swift 3.0
- iOS 8.0 or later

## Installation
#### [Carthage](https://github.com/Carthage/Carthage)
- Insert `github "to4iki/OctavKit"` to your Cartfile.
- Run `carthage update`.
- Link your app with `OctavKit.framework` and `Himotoki.framework` and `Result.framework` in `Carthage/Build`.

## Usage

```swift
// Setup your conference id(required)
OctavKit.setup(conferenceId: "YOUR_CONFERENCE_ID")

// Set local(option)
OctavKit.setLocal(Locale.current)

// Session receives an instance of a type that conforms to Request.
OctavKit.sessions { result in
    switch result {
    case .success(let response):
        print("success: \(response)")
    case .failure(let error):
        print("error: \(error)")
    }
}
```

[carthage-url]: https://github.com/Carthage/Carthage
[carthage-image]: https://img.shields.io/badge/Carthage-compatible-4BC51D.svg?style=flat
