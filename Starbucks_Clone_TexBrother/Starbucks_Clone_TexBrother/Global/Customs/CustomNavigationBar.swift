//
//  CustomNavigationBar.swift
//  Starbucks_Clone_TexBrother
//
//  Created by 노한솔 on 2021/09/22.
//

import UIKit

import AsyncDisplayKit

// MARK:  - CustomNavigationBar

class CustomNavigationBar: ASDisplayNode {
    
    // MARK: - Components
    
    let backButton: ASButtonNode = {
        let node = ASButtonNode()
        node.backgroundColor = .black
        node.style.preferredSize = CGSize(width: 15, height: 15)
        return node
    }()
    
    let titleLabel: ASTextNode = {
        let node = ASTextNode()
        node.isHidden = true
        return node
    }()
    
    let rightButton: ASButtonNode = {
        let node = ASButtonNode()
        node.backgroundColor = .black
        node.isHidden = true
        node.style.preferredSize = CGSize(width: 15, height: 15)
        return node
    }()
    
    // MARK: - LifeCycles
    
    override init() {
        super.init()
    }
}

// MARK: - Extensions

extension CustomNavigationBar {
    
    // MARK: - Layout Helpers
    
    override func layoutSpecThatFits(_ constrainedSize: ASSizeRange) -> ASLayoutSpec {
        return ASStackLayoutSpec(
            direction: .horizontal,
            spacing: 0,
            justifyContent: .spaceBetween,
            alignItems: .center,
            children: [backButton, titleLabel, rightButton]
        )
    }
    
    // MARK: - General Helpers
    
    func setupBar(isBackButton: Bool, title: String? = nil, right: String? = nil) {
        if !isBackButton {
            backButton.isHidden = true
        }
        if let text = title {
            titleLabel.attributedText = NSAttributedString(string: text)
        }
        if let rightText = right {
            rightButton.setBackgroundImage(UIImage(named: rightText), for: .normal)
        }
    }
}
