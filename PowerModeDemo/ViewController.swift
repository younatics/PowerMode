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
        PowerMode.sparkColors = [UIColor.red, UIColor.orange, UIColor.yellow, UIColor.green, UIColor.blue, UIColor.purple, UIColor.brown]
        PowerMode.isSparkActionEnabled = true

        // Shake values
        PowerMode.isShakeActionEnabled = false
        PowerMode.shakeTranslationX = 0
        PowerMode.shakeTranslationY = 2
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
}


