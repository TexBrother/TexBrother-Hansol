//
//  PayNodeController.swift
//  Starbucks_Clone_TexBrother
//
//  Created by 노한솔 on 2021/09/22.
//

import UIKit

import AsyncDisplayKit
import Then

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
    
    private let navigationView: CustomNavigationBar = {
        let node = CustomNavigationBar()
        node.setupBar(isBackButton: false, right: "")
        node.style.height = ASDimension(unit: .points, value: 30)
        return node
    }()
    
    private let titleLabel = ASTextNode().then {
        $0.attributedText = NSAttributedString(
            string: "Pay",
            attributes: [
                .font: UIFont.boldSystemFont(ofSize: 24),
                .foregroundColor: UIColor.black
            ]
        )
    }
    
    private let menuView = PayMenuNode().then {
        $0.backgroundColor = .clear
        $0.style.height = ASDimension(unit: .points, value: 40)
    }
    
    private let bannerButton: ASButtonNode = {
        let node = ASButtonNode()
        node.backgroundColor = .black
        node.style.height = ASDimension(unit: .points, value: 60)
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
