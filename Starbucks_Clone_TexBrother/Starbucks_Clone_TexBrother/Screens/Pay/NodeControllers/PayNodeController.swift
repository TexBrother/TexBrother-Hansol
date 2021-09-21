//
//  PayNodeController.swift
//  Starbucks_Clone_TexBrother
//
//  Created by 노한솔 on 2021/09/22.
//

import UIKit

import AsyncDisplayKit

// MARK: - PayNodeController

final class PayNodeController: ASDKViewController<ASScrollNode> {

    // MARK: - Lazy Components
    
    private lazy var cardCollectionNode = { () -> ASPagerNode in
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        
        let node = ASPagerNode(frame: .zero, collectionViewLayout: layout)
        node.isPagingEnabled = true
        return node
    }()
    
    // MARK: - Components
    
    private let listIcon: ASImageNode = {
        let node = ASImageNode()
        node.backgroundColor = .black
        return node
    }()
    
    
    // MARK: - Background Thread
    
    override init() {
        super.init(node: ASScrollNode())
        node.automaticallyManagesSubnodes = true
        node.automaticallyRelayoutOnSafeAreaChanges = true
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Main Thread
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
}
