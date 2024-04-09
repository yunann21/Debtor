//
//  TextField.swift
//  Debtor
//
//  Created by Anna Ablogina on 09.04.2024.
//

import UIKit

extension UIView {
    func shake() {
        let shaking = CABasicAnimation(keyPath: "position")
        shaking.duration = 0.05
        shaking.repeatCount = 2
        shaking.autoreverses = true
        
        let startPosition = CGPoint(x: center.x - 5.0, y: center.y)
        let finalPosition = CGPoint(x: center.x + 5.0, y: center.y)
        
        shaking.fromValue = NSValue(cgPoint: startPosition)
        shaking.toValue = NSValue(cgPoint: finalPosition)
        
        layer.add(shaking, forKey: nil)
    }
}
