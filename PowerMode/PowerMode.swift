//
//  PowerMode.swift
//  PowerMode
//
//  Created by YiSeungyoun on 2017. 12. 9..
//  Copyright © 2017년 Seungyounyi. All rights reserved.
//

import UIKit

public class PowerMode: NSObject {
    
    enum PowerModeKeys {
        static let sparkColors = "PowerModeColors"
        static let isSparkActionEnabled = "PowerModeIsSparkActionEnabled"
        static let isShakeActionEnabled = "PowerModeIsShakeActionEnabled"
        static let shakeTranslationX = "PowerModeShakeTranslationX"
        static let shakeTranslationY = "PowerModeShakeTranslationY"
    }
    
    public class var sparkColors: [UIColor] {
        get {
            if let hexArray = UserDefaults.standard.stringArray(forKey: PowerModeKeys.sparkColors) {
                let colors = hexArray.map { UIColor(hexString: $0) }
                return colors
            } else {
                return [UIColor.black]
            }
        }

        set(newValue) {
            let hexArray = newValue.map { $0.toHexString() }
            UserDefaults.standard.set(hexArray, forKey: PowerModeKeys.sparkColors)
        }
    }
    
    public class var isSparkActionEnabled: Bool {
        get {
            if let value = UserDefaults.standard.object(forKey: PowerModeKeys.isSparkActionEnabled) as? Bool {
                return value
            } else {
                return true
            }
        }
        set(newValue) {
            UserDefaults.standard.set(newValue, forKey: PowerModeKeys.isSparkActionEnabled)
        }
    }
    
    public class var isShakeActionEnabled: Bool {
        get {
            if let value = UserDefaults.standard.object(forKey: PowerModeKeys.isShakeActionEnabled) as? Bool {
                return value
            } else {
                return true
            }
        }
        set(newValue) {
            UserDefaults.standard.set(newValue, forKey: PowerModeKeys.isShakeActionEnabled)
        }
    }
    
    public class var shakeTranslationX: CGFloat {
        get {
            if let value = UserDefaults.standard.object(forKey: PowerModeKeys.shakeTranslationX) as? CGFloat {
                return value
            } else {
                return 0
            }
        }
        set(newValue) {
            UserDefaults.standard.set(newValue, forKey: PowerModeKeys.shakeTranslationX)
        }
    }
    
    public class var shakeTranslationY: CGFloat {
        get {
            if let value = UserDefaults.standard.object(forKey: PowerModeKeys.shakeTranslationY) as? CGFloat {
                return value
            } else {
                return 2
            }
        }
        set(newValue) {
            UserDefaults.standard.set(newValue, forKey: PowerModeKeys.shakeTranslationY)
        }
    }
    
    class func animate(in textInput: UITextInput, with range: NSRange) -> CGRect? {
        let beginning = textInput.beginningOfDocument
        var start = textInput.position(from: beginning, offset: range.location)
        
        guard let _start = start else { return nil }
        var end = textInput.position(from: _start, offset: range.length)

        guard let _end = end else { return nil }
        var textRange = textInput.textRange(from: _start, to: _end)

        guard let _textRange = textRange else { return nil }
        var rect = textInput.firstRect(for: _textRange)
        
        if rect.origin.x.isInfinite || rect.origin.y.isInfinite {
            start = textInput.position(from: beginning, offset: range.location - 1)
            
            guard let _start = start else { return nil }
            end = textInput.position(from: _start, offset: range.length)
            
            guard let _end = end else { return nil }
            textRange = textInput.textRange(from: _start, to: _end)
            
            guard let _textRange = textRange else { return nil }
            rect = textInput.firstRect(for: _textRange)
            
            rect.origin.x += 10
        }
        return rect
    }
}

extension UIColor {
    convenience init(hexString:String) {
        let hexString          = hexString.trimmingCharacters(in: CharacterSet.whitespacesAndNewlines)
        let scanner            = Scanner(string: hexString)
        
        if (hexString.hasPrefix("#")) {
            scanner.scanLocation = 1
        }
        
        var color:UInt32 = 0
        scanner.scanHexInt32(&color)
        
        let mask = 0x000000FF
        let r = Int(color >> 16) & mask
        let g = Int(color >> 8) & mask
        let b = Int(color) & mask
        
        let red   = CGFloat(r) / 255.0
        let green = CGFloat(g) / 255.0
        let blue  = CGFloat(b) / 255.0
        
        self.init(red:red, green:green, blue:blue, alpha:1)
    }
    func toHexString() -> String {
        var r:CGFloat = 0
        var g:CGFloat = 0
        var b:CGFloat = 0
        var a:CGFloat = 0
        
        getRed(&r, green: &g, blue: &b, alpha: &a)
        
        let rgb:Int = (Int)(r*255)<<16 | (Int)(g*255)<<8 | (Int)(b*255)<<0
        
        return String(format:"#%06x", rgb)
    }
}

