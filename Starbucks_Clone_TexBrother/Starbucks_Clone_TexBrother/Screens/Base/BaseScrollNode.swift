//
//  BaseScrollNode.swift
//  Starbucks_Clone_TexBrother
//
//  Created by 노한솔 on 2021/09/22.
//

import UIKit

import AsyncDisplayKit

// MARK: - BaseScrollNode

class BaseScrollNode: ASScrollNode {


    // MARK: - LifeCycles
    
    override init() {
        super.init()
        self.automaticallyManagesSubnodes = true
    }
    
    // MARK: - Layout
    
    override func layoutSpecThatFits(_ constrainedSize: ASSizeRange) -> ASLayoutSpec {
        <#code#>
    }

   
}
