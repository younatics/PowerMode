//
//  ViewController.swift
//  PowerModeDemo
//
//  Created by USER on 2017. 12. 8..
//  Copyright © 2017년 Seungyounyi. All rights reserved.
//

import UIKit
import PowerMode

class ViewController: UIViewController {
    @IBOutlet var powerModeTextView: PowerModeTextView!
    @IBOutlet var powerModeTextField: PowerModeTextField!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Spark values
        PowerMode.sparkColors = [UIColor(hexString: "#9dc6d8"), UIColor(hexString: "#00b3ca"), UIColor(hexString: "#7dd0b6")]
//        PowerMode.sparkColors = [UIColor.red, UIColor.orange, UIColor.yellow, UIColor.green, UIColor.blue, UIColor.purple, UIColor.brown]
        PowerMode.isSparkActionEnabled = true

        // Shake values
        PowerMode.isShakeActionEnabled = true
        PowerMode.shakeTranslationX = 0
        PowerMode.shakeTranslationY = 2
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
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
}
