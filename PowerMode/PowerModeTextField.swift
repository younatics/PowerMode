//
//  PowerModeTextField.swift
//  PowerMode
//
//  Created by YiSeungyoun on 2017. 12. 9..
//  Copyright © 2017년 Seungyounyi. All rights reserved.
//

import UIKit

public class PowerModeTextField: UITextField, UITextFieldDelegate {
    @IBOutlet public weak var pmTextFieldDelegate: UITextFieldDelegate?
    
    override public var delegate: UITextFieldDelegate? {
        didSet {
            if delegate !== self {
                fatalError("Please use pmTextFieldDelegate for delegate")
            }
        }
    }

    public override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.delegate = self
    }
    
    public required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        self.delegate = self
    }
    
    // MARK: - UITextFieldDelegate
    public func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        guard let rect = PowerMode.animate(in: textField, with: range), let superView = self.superview else {
            return pmTextFieldDelegate?.textField?(textField, shouldChangeCharactersIn: range, replacementString: string) ?? true
        }
        
        let convertedRect = convert(rect, to: superView)
        
        if PowerMode.isSparkActionEnabled {
            SparkAction.shared.at(position: CGPoint(x: convertedRect.origin.x, y: convertedRect.origin.y), with: PowerMode.sparkColors, in: superView)
        }
        
        if PowerMode.isShakeActionEnabled {
            ShakeAction.shared.shake(view: self)
        }
        
        return pmTextFieldDelegate?.textField?(textField, shouldChangeCharactersIn: range, replacementString: string) ?? true
    }

    public func textFieldShouldBeginEditing(_ textField: UITextField) -> Bool {
        return pmTextFieldDelegate?.textFieldShouldBeginEditing?(textField) ?? true
    }
    
    public func textFieldDidBeginEditing(_ textField: UITextField) {
        pmTextFieldDelegate?.textFieldDidBeginEditing?(textField)
    }
    
    public func textFieldShouldEndEditing(_ textField: UITextField) -> Bool {
        return pmTextFieldDelegate?.textFieldShouldEndEditing?(textField) ?? true
    }
    
    public func textFieldDidEndEditing(_ textField: UITextField) {
        pmTextFieldDelegate?.textFieldDidEndEditing?(textField)
    }
    
    @available(iOS 10.0, *)
    public func textFieldDidEndEditing(_ textField: UITextField, reason: UITextFieldDidEndEditingReason) {
        pmTextFieldDelegate?.textFieldDidEndEditing?(textField, reason: reason)
    }
    
    public func textFieldShouldClear(_ textField: UITextField) -> Bool {
        return pmTextFieldDelegate?.textFieldShouldClear?(textField) ?? true
    }
    
    public func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        return pmTextFieldDelegate?.textFieldShouldReturn?(textField) ?? true
    }
    
}
