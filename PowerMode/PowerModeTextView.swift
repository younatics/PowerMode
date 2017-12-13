//
//  PowerModeTextView.swift
//  PowerMode
//
//  Created by YiSeungyoun on 2017. 12. 8..
//  Copyright © 2017년 Seungyounyi. All rights reserved.
//

import UIKit

public class PowerModeTextView: UITextView, UITextViewDelegate {
    @IBOutlet public weak var pmTextViewDelegate: UITextViewDelegate?
    
    override public var delegate: UITextViewDelegate? {
        didSet {
            if delegate !== self {
                fatalError("Please use pmTextViewDelegate for delegate")
            }
        }
    }
    
    override public init(frame: CGRect, textContainer: NSTextContainer?) {
        super.init(frame: frame, textContainer: textContainer)
        
        self.delegate = self
    }
    
    required public init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        self.delegate = self
    }
    
    // MARK: - UITextViewDelegate
    public func textView(_ textView: UITextView, shouldChangeTextIn range: NSRange, replacementText text: String) -> Bool {
        guard let rect = PowerMode.animate(in: textView, with: range), let superView = self.superview else {
            return pmTextViewDelegate?.textView?(textView, shouldChangeTextIn: range, replacementText: text) ?? true
        }
        
        let convertedRect = convert(rect, to: superView)
        
        if PowerMode.isSparkActionEnabled {
            SparkAction.shared.at(position: CGPoint(x: convertedRect.origin.x, y: convertedRect.origin.y), with: PowerMode.sparkColors, in: superView)
        }
        
        if PowerMode.isShakeActionEnabled {
            ShakeAction.shared.shake(view: self)
        }
        
        return pmTextViewDelegate?.textView?(textView, shouldChangeTextIn: range, replacementText: text) ?? true
    }
    
    public func textViewShouldBeginEditing(_ textView: UITextView) -> Bool {
        return pmTextViewDelegate?.textViewShouldBeginEditing?(textView) ?? true
    }
    
    public func textViewShouldEndEditing(_ textView: UITextView) -> Bool {
        return pmTextViewDelegate?.textViewShouldEndEditing?(textView) ?? true
    }
    
    public func textViewDidBeginEditing(_ textView: UITextView) {
        pmTextViewDelegate?.textViewDidBeginEditing?(textView)
    }
    
    public func textViewDidEndEditing(_ textView: UITextView) {
        pmTextViewDelegate?.textViewDidEndEditing?(textView)
    }
    
    public func textViewDidChange(_ textView: UITextView) {
        pmTextViewDelegate?.textViewDidChange?(textView)
    }
    
    public func textViewDidChangeSelection(_ textView: UITextView) {
        pmTextViewDelegate?.textViewDidChangeSelection?(textView)
    }

    @available(iOS 10.0, *)
    public func textView(_ textView: UITextView, shouldInteractWith URL: URL, in characterRange: NSRange, interaction: UITextItemInteraction) -> Bool {
        return pmTextViewDelegate?.textView?(textView, shouldInteractWith: URL, in: characterRange, interaction: interaction) ?? true
    }
    
    @available(iOS 10.0, *)
    public func textView(_ textView: UITextView, shouldInteractWith textAttachment: NSTextAttachment, in characterRange: NSRange, interaction: UITextItemInteraction) -> Bool {
        return pmTextViewDelegate?.textView?(textView, shouldInteractWith: textAttachment, in: characterRange, interaction: interaction) ?? true
    }
    
}
