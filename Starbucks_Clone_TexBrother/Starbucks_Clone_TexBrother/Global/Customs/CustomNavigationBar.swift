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
    
    let backButton: ASImageNode = {
        let node = ASImageNode()
        node.backgroundColor = .black
        return node
    }()
    
    let titleLabel: ASTextNode = {
        let node = ASTextNode()
        return node
    }()
    
    let rightButton: ASImageNode = {
        let node = ASImageNode()
        node.backgroundColor = .black
        return node
    }()
    
    // MARK: - LifeCycles
    
    override init() {
        super.init()
    }
}

// MARK: - Extensions

extension CustomNavigationBar {
    
    // MARK: - Helpers
    
    func setupBar(isBackButton: Bool, title: String, rightButton: String) {
        
    }
}
