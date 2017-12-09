//
//  ViewController.swift
//  PowerModeDemo
//
//  Created by USER on 2017. 12. 8..
//  Copyright © 2017년 Seungyounyi. All rights reserved.
//

import UIKit
import PowerMode

class ViewController: UIViewController, UITextViewDelegate {
    @IBOutlet var demoTextView: UITextView!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        demoTextView.delegate = self
//        demoTextField.addTarget(self, action: #selector(textDidChange), for: .editingChanged)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func textView(_ textView: UITextView, shouldChangeTextIn range: NSRange, replacementText text: String) -> Bool {
        let beginning = textView.beginningOfDocument
        let start = textView.position(from: beginning, offset: range.location)
        let end = textView.position(from: start!, offset: range.length)
        
        let textRange = textView.textRange(from: start!, to: end!)
        let rect = textView.firstRect(for: textRange!)
        
        SparkAction.shared.at(position: CGPoint(x: rect.origin.x, y: rect.origin.y), with: UIColor.red, in: textView)
        
        return true
    }
    
    

    @objc func textDidChange(_ sender: UITextField) {
//        NSUInteger count = 0;
//        NSInteger location = textView.selectedRange.location;
//        NSRect rect = *[textView.layoutManager rectArrayForCharacterRange:NSMakeRange(location, 0)
//            withinSelectedCharacterRange:NSMakeRange(location, 0)
//            inTextContainer:textView.textContainer
//            rectCount:&count];
//        CGPoint position = rect.origin;
//
//        // Get the color under the cursor
//        location = MAX(location - 1, 0);
//        NSRange range = NSMakeRange(location, 1);
//        NSColor *color = [self.sourceCodeDocument.textStorage colorAtCharacterIndex:location
//            effectiveRange:&range
//            context:nil];
//        if (!color) {
//            color = [NSColor whiteColor];
//        }

    }

}


