# 🎶 PowerMode in iOS!
[![Swift Package Manager](https://img.shields.io/badge/Swift_Package_Manager-compatible-brightgreen.svg?style=flat)](Package.swift)
[![CocoaPods](https://img.shields.io/cocoapods/v/PowerMode.svg?style=flat)](https://cocoapods.org/pods/PowerMode)
![iOS 13.0+](https://img.shields.io/badge/iOS-13.0%2B-blue.svg?style=flat)
[![Swift 6.0](https://img.shields.io/badge/Swift-6.0-orange.svg?style=flat)](https://developer.apple.com/swift/)
[![License: MIT](https://img.shields.io/badge/license-MIT-blue.svg?style=flat)](LICENSE)

![Shake_SparkAction_UITextView](https://github.com/younatics/PowerMode/blob/master/Images/Shake_SparkAction_UITextView.gif)

| Spark action | Shake action |
| :----------: | :----------: |
| ![SparkAction_UITextField](https://github.com/younatics/PowerMode/blob/master/Images/SparkAction_UITextField.gif) | ![ShakeAction_UITextField](https://github.com/younatics/PowerMode/blob/master/Images/ShakeAction_UITextField.gif) |
| ![SparkAction_UITextView](https://github.com/younatics/PowerMode/blob/master/Images/SparkAction_UITextView.gif)  | ![ShakeAction_UITextView](https://github.com/younatics/PowerMode/blob/master/Images/ShakeAction_UITextView.gif)  |

## Requirements
`PowerMode` requires Swift 6.0 and iOS 13.0+. It supports Swift Package Manager and CocoaPods.

## Usage
Import `PowerMode`, then use `PowerModeTextView` or `PowerModeTextField`. Done!

```swift
import PowerMode

let textView = PowerModeTextView(frame: .zero, textContainer: nil)
let textField = PowerModeTextField(frame: .zero)
```

Use `pmTextViewDelegate` or `pmTextFieldDelegate` for delegate.

```swift
textView.pmTextViewDelegate = self
textField.pmTextFieldDelegate = self
```

You can also configure the properties listed below on `PowerMode`.

```swift
PowerMode.sparkColors = [.systemPink, .systemBlue]
PowerMode.isSparkActionEnabled = true
PowerMode.isShakeActionEnabled = true
PowerMode.shakeTranslationX = 0
PowerMode.shakeTranslationY = 2
```

#### Spark action Property

| Property | Type | Default |
| -------- | ---- | ------- |
| `PowerMode.isSparkActionEnabled` | `Bool` | `true` |
| `PowerMode.sparkColors` | `[UIColor]` | `[UIColor.black]` |

#### Shake action Property
| Property | Type | Default |
| -------- | ---- | ------- |
| `PowerMode.isShakeActionEnabled` | `Bool` | `true` |
| `PowerMode.shakeTranslationX` | `CGFloat` | `0` |
| `PowerMode.shakeTranslationY` | `CGFloat` | `2` |


## Installation
### Swift Package Manager

In Xcode, choose **File ▸ Add Package Dependencies…** and enter:

```
https://github.com/younatics/PowerMode.git
```

Or add it to your `Package.swift`:

```swift
dependencies: [
    .package(url: "https://github.com/younatics/PowerMode.git", from: "1.0.0")
]
```

### CocoaPods

```ruby
pod 'PowerMode', '~> 1.0.0'
```

## References
#### Please tell me or make pull request if you use this library in your application :) 

## Author
[younatics](https://twitter.com/younatics)
<a href="http://twitter.com/younatics" target="_blank"><img alt="Twitter" src="https://img.shields.io/twitter/follow/younatics.svg?style=social&label=Follow"></a>

## License
**PowerMode** is available under the MIT license. See the LICENSE file for more info.
