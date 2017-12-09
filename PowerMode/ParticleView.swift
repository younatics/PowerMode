//
//  ParticleView.swift
//  PowerMode
//
//  Created by YiSeungyoun on 2017. 12. 8..
//  Copyright © 2017년 Seungyounyi. All rights reserved.
//

import UIKit

class ParticleView: UIView {
    static let size = CGSize(width: 3, height: 3)
    var position: CGPoint? {
        didSet {
            guard let _position = position else { return }
            self.frame = CGRect(origin: _position, size: ParticleView.size)
        }
    }
    var color: UIColor?
    var velocity: CGPoint?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
    }
    
    convenience init(frame: CGRect, position: CGPoint, color: UIColor) {
        let customizedSize = CGRect(origin: position, size: ParticleView.size)
        self.init(frame: customizedSize)
        
        self.position = position
        self.color = color
        self.velocity = CGPoint(x: -1.0 + (Double(arc4random_uniform(100)) / 100.0) * 2, y: -3.5 + (Double(arc4random_uniform(100)) / 100.0) * 2)
    
    }
    
    override func draw(_ rect: CGRect) {
        super.draw(rect)
        
        let color = self.color?.withAlphaComponent(self.alpha + 0.3)
        color?.set()
        
        let path = UIBezierPath(roundedRect: rect, cornerRadius: 3)
        path.fill()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
