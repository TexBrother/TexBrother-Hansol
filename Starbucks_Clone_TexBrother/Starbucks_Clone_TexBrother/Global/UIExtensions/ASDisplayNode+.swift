//
//  ASDisplayNode+.swift
//  Starbucks_Clone_TexBrother
//
//  Created by 노한솔 on 2021/10/06.
//

import AsyncDisplayKit

extension ASDisplayNode {
    
    func applyCardShadow(
        color: UIColor = .black,
        alpha: CGFloat = 0.16,
        x: CGFloat = 0,
        y: CGFloat = 3,
        blur: CGFloat = 2
    ) {
        print("여기야여기")
        shadowColor = color.cgColor
        shadowOpacity = alpha
        shadowOffset = CGSize(width: x, height: y)
        shadowRadius = blur / 1.0
        clipsToBounds = false
        
        layer.shadowPath = UIBezierPath(roundedRect: self.bounds, cornerRadius: self.cornerRadius).cgPath
        layer.shouldRasterize = true
        layer.rasterizationScale = UIScreen.main.scale
    }
}
