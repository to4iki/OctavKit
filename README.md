# OctavKit
[![Carthage compatible][carthage-image]][carthage-url]

Swift toolkit for the Octav API.

## Requirements
- Swift 4.1 or later
- iOS 9.0 or later

## Installation
#### [Carthage](https://github.com/Carthage/Carthage)
- Insert `github "to4iki/OctavKit"` to your Cartfile.
- Run `carthage bootstrap --platform iOS`.

## Usage

```swift
// Setup your conference id(required)
OctavKit.setup(conferenceId: "YOUR_CONFERENCE_ID")

// Set locale(option)
OctavKit.setLocale(Locale.current)

// Sessions receives an instance of a type that conforms to Request.
OctavKit.sessions { result in
    switch (value, error) {
    case (let value?, _):
        print("success: \(value)")
    case (_, let error?):
        print("error: \(error)")
    case (.none, .none):
        fatalError("unreachable")
    }
}

// Sponsors receives an instance of a type that conforms to Request.
OctavKit.sponsors { (value, error) in ...

// Conference receives an instance of a type that conforms to Request.
OctavKit.conference { (value, error) in ...
```

[carthage-url]: https://github.com/Carthage/Carthage
[carthage-image]: https://img.shields.io/badge/Carthage-compatible-4BC51D.svg?style=flat
