//
//  SparkAction.swift
//  PowerMode
//
//  Created by YiSeungyoun on 2017. 12. 8..
//  Copyright © 2017년 Seungyounyi. All rights reserved.
//

import UIKit

class SparkAction: NSObject {
    static let shared = SparkAction()
    let MaxParticleCount = 100
    
    var enableAction: Bool = false
    var timer: Timer?
    var particleDictionary = NSMutableDictionary()
    var index = 0
    
    func at(position: CGPoint, with color: UIColor, in view: UIView) {
        let number = 5 + Int(arc4random_uniform(5))
        
        for _ in 0..<number {
            let particle = ParticleView(frame: CGRect(), position: position, color: color)
            view.addSubview(particle)
            self.index = (self.index + 1) % MaxParticleCount
            self.particleDictionary.removeObject(forKey: self.index)
            self.particleDictionary.setObject(particle, forKey: self.index as NSCopying)
            
        }
    }
    
    func update() {
        self.particleDictionary.enumerateKeysAndObjects { (key, particle, stop) in
            guard let _key = key as? Int, let _particle = particle as? ParticleView else { return }
            
            
            if _particle.alpha <= 0.1 {
                _particle.removeFromSuperview()
                self.particleDictionary.removeObject(forKey: _key)
                return
            }
            
            _particle.alpha *= 0.91
            
            guard let velocity = _particle.velocity else { return }
            _particle.velocity = CGPoint(x: velocity.x, y: velocity.y + 0.175)
            _particle.position = CGPoint(x: velocity.x + velocity.x, y: velocity.y + velocity.y)
        }
    }
}
