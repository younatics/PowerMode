//
//  PowerModeTextView.swift
//  PowerMode
//
//  Created by YiSeungyoun on 2017. 12. 8..
//  Copyright © 2017년 Seungyounyi. All rights reserved.
//

import UIKit

public class PowerModeTextView: UITextView, UITextViewDelegate {
    override public init(frame: CGRect, textContainer: NSTextContainer?) {
        super.init(frame: frame, textContainer: textContainer)
        
        self.delegate = self
    }
    
    required public init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        self.delegate = self
    }
    
    public func textView(_ textView: UITextView, shouldChangeTextIn range: NSRange, replacementText text: String) -> Bool {
        let beginning = self.beginningOfDocument
        let start = self.position(from: beginning, offset: range.location)
        
        guard let _start = start else { return true }
        let end = self.position(from: _start, offset: range.length)
        
        guard let _end = end else { return true }
        let textRange = self.textRange(from: _start, to: _end)
        
        guard let _textRange = textRange else { return true }
        let rect = self.firstRect(for: _textRange)
        
        guard let superView = self.superview else { return true }
        let convertedRect = convert(rect, to: superView)
        
        SparkAction.shared.at(position: CGPoint(x: convertedRect.origin.x, y: convertedRect.origin.y), with: UIColor.red, in: superView)
        
        return true
    }
}
