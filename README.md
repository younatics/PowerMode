# 🎶 PowerMode in iOS!
[![Version](https://img.shields.io/cocoapods/v/PowerMode.svg?style=flat)](http://cocoapods.org/pods/PowerMode)
[![Carthage Compatible](https://img.shields.io/badge/Carthage-compatible-4BC51D.svg?style=flat)](https://github.com/Carthage/Carthage)
[![License: MIT](https://img.shields.io/badge/license-MIT-blue.svg?style=flat)](https://github.com/younatics/PowerMode/blob/master/LICENSE)
[![Platform](https://img.shields.io/cocoapods/p/PowerMode.svg?style=flat)](http://cocoapods.org/pods/PowerMode)
[![Build Status](https://travis-ci.org/younatics/PowerMode.svg?branch=master)](https://travis-ci.org/younatics/PowerMode)
[![Swift 4.0](https://img.shields.io/badge/Swift-4.0-orange.svg?style=flat)](https://developer.apple.com/swift/)
![iOS 9.0+](https://img.shields.io/badge/iOS-9.0%2B-blue.svg)

![Shake_SparkAction_UITextView](https://github.com/younatics/PowerMode/blob/master/Images/Shake_SparkAction_UITextView.gif)

| Spark action | Shake action |
| :----------: | :----------: |
| ![SparkAction_UITextField](https://github.com/younatics/PowerMode/blob/master/Images/SparkAction_UITextField.gif) | ![ShakeAction_UITextField](https://github.com/younatics/PowerMode/blob/master/Images/ShakeAction_UITextField.gif) |
| ![SparkAction_UITextView](https://github.com/younatics/PowerMode/blob/master/Images/SparkAction_UITextView.gif)  | ![ShakeAction_UITextView](https://github.com/younatics/PowerMode/blob/master/Images/ShakeAction_UITextView.gif)  |

## Requirements
`PowerMode` is written in Swift 4. Compatible with iOS 9.0+

## Usage
Just inherit `PowerModeTextView` or `PowerModeTextField`. Done!

Use `pmTextViewDelegate` or `pmTextFieldDelegate` for delegate.

You can also add some properties listed below

#### Spark action Property

| Property | Type | Default |
| -------- | ---- | ------- |
| `isSparkActionEnabled` | `Bool` | `true` |
| `sparkColors` | `[UIColor]` | `[UIColor.black]` |

#### Shake action Property
| Property | Type | Default |
| -------- | ---- | ------- |
| `isShakeActionEnabled` | `Bool` | `true` |
| `shakeTranslationX` | `CGFloat` | `0` |
| `shakeTranslationY` | `CGFloat` | `2` |


## Installation
### Cocoapods
```ruby
pod 'PowerMode'
```
### Carthage
```
github "younatics/PowerMode"
```

## References
#### Please tell me or make pull request if you use this library in your application :) 

## Author
[younatics](https://twitter.com/younatics)
<a href="http://twitter.com/younatics" target="_blank"><img alt="Twitter" src="https://img.shields.io/twitter/follow/younatics.svg?style=social&label=Follow"></a>

## License
**PowerMode** is available under the MIT license. See the LICENSE file for more info.
