//
//  PowerMode.swift
//  PowerMode
//
//  Created by YiSeungyoun on 2017. 12. 9..
//  Copyright © 2017년 Seungyounyi. All rights reserved.
//

import UIKit

class PowerMode: NSObject {
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
