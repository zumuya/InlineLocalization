# InlineLocalization

- Requirements: macOS 10.15 or later, iOS 13 or later
- Swift version: 5.4

## General usage

### String

```swift
import InlineLocalization

let hello = String(localizedIn: [
    .english: "Hello",
    .japanese: "こんにちは",
])
```

### Error

```swift
import InlineLocalization

enum MyError: InlineLocalizedError
{
    case strange
    
    var localizedMessages: InlineLocalizedErrorTable
    {
        switch self {
        case .strange:
            return .init(
                errorDescription: [
                    .japanese: "変なエラーが発生しました。",
                ],
                recoverySuggestion: [
                    .japanese: "気を取り直してください。",
                ]
            )
        }
    }
}
```

### SwiftUI Text

```swift
import InlineLocalizationUI

Text(localizedIn: [
    .english: "Hello",
    .japanese: "こんにちは",
])
```

### Define Custom Language
```swift
extension Language
{
    static let spanish = Self(rawValue: "es")
}
```

## License

This library is distributed under the terms of the [MIT License](LICENSE).
