//
//  SparkAction.swift
//  PowerMode
//
//  Created by YiSeungyoun on 2017. 12. 8..
//  Copyright © 2017년 Seungyounyi. All rights reserved.
//

import UIKit

/// Spark action in 
public class SparkAction: NSObject {
    /// Singleton
    public static let shared = SparkAction()
    
    /// Get MaxParticleCount
    public let MaxParticleCount = 300
    
    var timer: Timer?
    var particleDictionary = NSMutableDictionary()
    var index = 0
    
    public func at(position: CGPoint, with colors: [UIColor], in view: UIView) {
        let number = 5 + Int(arc4random_uniform(5))
        
        for _ in 0..<number {
            let randomColor = colors[Int(arc4random_uniform(UInt32(colors.count)))]
            let particle = ParticleView(frame: CGRect(), position: position, color: randomColor)
            view.addSubview(particle)
            self.index = (self.index + 1) % MaxParticleCount
            self.particleDictionary.removeObject(forKey: self.index)
            self.particleDictionary.setObject(particle, forKey: self.index as NSCopying)

        }
        
        self.timer?.invalidate()
        self.timer = Timer.scheduledTimer(timeInterval: 0.025, target: self, selector: #selector(update), userInfo: nil, repeats: true)
        
    }
    
    @objc func update() {
        self.particleDictionary.enumerateKeysAndObjects { (key, particle, stop) in
            guard let _key = key as? Int, let _particle = particle as? ParticleView else { return }
            
            if _particle.alpha <= 0.1 {
                _particle.removeFromSuperview()
                self.particleDictionary.removeObject(forKey: _key)
                
                if self.particleDictionary.count == 0 {
                    self.timer?.invalidate()
                }
                return
            }
            
            _particle.alpha *= 0.91
            
            guard let velocity = _particle.velocity, let position = _particle.position else { return }
            _particle.velocity = CGPoint(x: velocity.x, y: velocity.y + 0.175)
            _particle.position = CGPoint(x: position.x + velocity.x, y: position.y + velocity.y)
        }
    }
}
