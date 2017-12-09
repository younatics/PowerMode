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
        guard let rect = PowerMode.animate(in: textView, with: range), let superView = self.superview else { return true }
        let convertedRect = convert(rect, to: superView)
        
        SparkAction.shared.at(position: CGPoint(x: convertedRect.origin.x, y: convertedRect.origin.y), with: PowerMode.colors, in: superView)
        return true
    }
}
