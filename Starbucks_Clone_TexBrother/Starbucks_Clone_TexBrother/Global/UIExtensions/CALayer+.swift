//
//  CALayer+.swift
//  Starbucks_Clone_TexBrother
//
//  Created by 노한솔 on 2021/09/29.


import UIKit

extension CALayer {
    func applyCardShadow(
        color: UIColor = .black,
        alpha: Float = 0.16,
        x: CGFloat = 0,
        y: CGFloat = 3,
        blur: CGFloat = 6
    ) {
        masksToBounds = false
        shadowColor = color.cgColor
        shadowOpacity = alpha
        shadowOffset = CGSize(width: x, height: y)
        shadowRadius = blur / 1.0
        
        shadowPath = UIBezierPath(rect: self.bounds).cgPath
    }
}
