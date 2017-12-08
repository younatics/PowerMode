//
//  ViewController.swift
//  PowerModeDemo
//
//  Created by USER on 2017. 12. 8..
//  Copyright © 2017년 Seungyounyi. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet var demoTextField: UITextField!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        demoTextField.addTarget(self, action: #selector(textDidChange), for: .editingChanged)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @objc func textDidChange(_ sender: UITextField) {
        
    }

}


