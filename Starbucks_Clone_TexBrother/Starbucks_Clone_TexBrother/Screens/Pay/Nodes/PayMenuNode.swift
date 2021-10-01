//
//  PayMenuNode.swift
//  Starbucks_Clone_TexBrother
//
//  Created by 노한솔 on 2021/09/22.
//

import Foundation

import AsyncDisplayKit

// MARK: - PayMenuNode

final class PayMenuNode: ASDisplayNode {
    
    // MARK: - Components
    
    private let couponButton: ASButtonNode = {
        let node = ASButtonNode()
        node.setTitle("Coupon", with: .boldSystemFont(ofSize: 15), with: .black, for: .normal)
        node.backgroundColor = .clear
        return node
    }()
    
    private let giftButton: ASButtonNode = {
        let node = ASButtonNode()
        node.setTitle("e-Gift Item", with: .boldSystemFont(ofSize: 15), with: .black, for: .normal)
        node.backgroundColor = .clear
        return node
    }()
    
    private let separatorView: ASDisplayNode = {
        let node = ASDisplayNode()
        node.backgroundColor = .gray
        node.style.preferredSize = CGSize(width: 1, height: 5)
        return node
    }()
    
    // MARK: - LifeCycles
    
    override init() {
        super.init()
    }
}

// MARK: - Extensions

extension PayMenuNode {
    
    // MARK: - Layout Helpers
    
    override func layoutSpecThatFits(_ constrainedSize: ASSizeRange) -> ASLayoutSpec {
        return ASStackLayoutSpec(
            direction: .horizontal,
            spacing: 0,
            justifyContent: .spaceAround,
            alignItems: .center,
            children: [couponButton, separatorView, giftButton]
        )
    }
}
