//
//  PowerMode.swift
//  PowerMode
//
//  Created by YiSeungyoun on 2017. 12. 9..
//  Copyright © 2017년 Seungyounyi. All rights reserved.
//

import UIKit

public class PowerMode: NSObject {
    public class var colors: [UIColor] {
        set {
            let hexArray = colors.map { $0.toHexString() }
            UserDefaults.standard.set(hexArray, forKey: "PowerModeColors")
        }
        
        get {
            if let hexArray = UserDefaults.standard.stringArray(forKey: "PowerModeColors") {
            let colors = hexArray.map { UIColor.fromHex(hex: $0) }
                return colors
            } else {
                return [UIColor.black]
            }
        }
    }
    
    class func animate(in textInput: UITextInput, with range: NSRange) -> CGRect? {
        let beginning = textInput.beginningOfDocument
        let start = textInput.position(from: beginning, offset: range.location)
        
        guard let _start = start else { return nil }
        let end = textInput.position(from: _start, offset: range.length)
        
        guard let _end = end else { return nil }
        let textRange = textInput.textRange(from: _start, to: _end)
        
        guard let _textRange = textRange else { return nil }
        let rect = textInput.firstRect(for: _textRange)
        
        return rect
    }
}

extension UIColor {
    class func fromHex(hex:String) -> UIColor {
        let scanner           = Scanner(string: hex)
        scanner.scanLocation  = 0
        var rgbValue: UInt64  = 0
        scanner.scanHexInt64(&rgbValue)
        
        return UIColor(
            red: CGFloat((rgbValue & 0xFF0000) >> 16) / 255.0,
            green: CGFloat((rgbValue & 0x00FF00) >> 8) / 255.0,
            blue: CGFloat(rgbValue & 0x0000FF) / 255.0,
            alpha: CGFloat(1.0)
        )
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

