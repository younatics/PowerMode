//
//  PowerModeTextField.swift
//  PowerMode
//
//  Created by YiSeungyoun on 2017. 12. 9..
//  Copyright © 2017년 Seungyounyi. All rights reserved.
//

import UIKit

public class PowerModeTextField: UITextField, UITextFieldDelegate {
    public override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.delegate = self
    }
    
    public required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        self.delegate = self
    }
    
    public func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        guard let rect = PowerMode.animate(in: textField, with: range), let superView = self.superview else { return true }
        let convertedRect = convert(rect, to: superView)
        
        if PowerMode.isSparkActionEnabled {
            SparkAction.shared.at(position: CGPoint(x: convertedRect.origin.x, y: convertedRect.origin.y), with: PowerMode.colors, in: superView)
        }
        
        if PowerMode.isShakeActionEnabled {
            ShakeAction.shared.shake(view: self)
        }
        
        return true
    }
}
