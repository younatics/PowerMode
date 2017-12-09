//
//  ShakeAction.swift
//  PowerMode
//
//  Created by YiSeungyoun on 2017. 12. 10..
//  Copyright © 2017년 Seungyounyi. All rights reserved.
//

import UIKit

class ShakeAction: NSObject {
    public static let shared = ShakeAction()

    func shake(view: UIView) {
        view.transform = CGAffineTransform(translationX: PowerMode.shakeTranslationX, y: PowerMode.shakeTranslationY)
        UIView.animate(withDuration: 0.4, delay: 0, usingSpringWithDamping: 0.2, initialSpringVelocity: 1, options: .curveEaseInOut, animations: {
            view.transform = CGAffineTransform.identity
        }, completion: nil)
    }
}
