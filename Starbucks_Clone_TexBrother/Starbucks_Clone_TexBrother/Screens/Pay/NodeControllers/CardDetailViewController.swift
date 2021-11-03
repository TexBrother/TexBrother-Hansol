//
//  CardDetailController.swift
//  Starbucks_Clone_TexBrother
//
//  Created by 노한솔 on 2021/10/27.
//

import UIKit

import AsyncDisplayKit
import Then

// MARK: - CardDetailController

final class CardDetailController: ASDKViewController<ASDisplayNode> {
    
    // MARK: - Lazy Components
    
    private lazy var menuTableNode = { () -> ASTableNode in
        let node = ASTableNode(style: .plain)
        node.backgroundColor = .systemGray6
        node.delegate = self
        node.dataSource = self
        return node
    }()
    
    // MARK: - Components
    
    private let titleView = ASDisplayNode().then {
        $0.backgroundColor = .clear
    }
    
    private let titleLabel = ASTextNode()
    private let editButton = ASButtonNode().then {
        $0.setBackgroundImage(UIImage.init(systemName: "pencil"), for: .normal)
    }
    
    private let cardImageNode = ASImageNode().then {
        $0.style.preferredSize = CGSize(width: 97, height: 30)
        $0.style.flexGrow = 1.0
    }
    
    private let remainingTitleLabel = ASTextNode()
    private let remainingContentLabel = ASTextNode()
    private let barcodeImageNode = ASImageNode().then {
        $0.image = UIImage(named: "barcode")
        $0.contentMode = .scaleAspectFit
    }
    
    private let cardNumberTextNode = ASTextNode().then {
        $0.attributedText = NSAttributedString(
            string: "****-****-**36-6582",
            attributes:
                [
                    .font: UIFont.systemFont(ofSize: 15, weight: .regular),
                    .foregroundColor: UIColor.black
                ]
        )
    }
    
    private let validationTitleLabelNode: ASTextNode = {
        let node = ASTextNode()
        node.attributedText = NSAttributedString(
            string: "바코드 유효시간",
            attributes:
                [.font: UIFont.systemFont(ofSize: 12, weight: .semibold),
                 .foregroundColor: UIColor.black
                ]
        )
        return node
    }()
    
    private let validationLabelNode: ASTextNode = {
        let node = ASTextNode()
        node.attributedText = NSAttributedString(
            string: "09:51",
            attributes:
                [.font: UIFont.systemFont(ofSize: 12, weight: .semibold),
                 .foregroundColor: UIColor.primary
                ]
        )
        return node
    }()
    
    // MARK: - Background Thread
    
    override init() {
        super.init(node: ASDisplayNode())
        node.automaticallyManagesSubnodes = true
        node.automaticallyRelayoutOnSafeAreaChanges = true
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

// MARK: - TableNode DataSource

extension CardDetailController: ASTableDataSource {
  
  func numberOfSections(in tableNode: ASTableNode) -> Int {
    return 1
  }
  
  func tableNode(_ tableNode: ASTableNode, numberOfRowsInSection section: Int) -> Int {
    return 5
  }
  
  func tableNode(_ tableNode: ASTableNode, nodeBlockForRowAt indexPath: IndexPath) -> ASCellNodeBlock {
    

      return { ASCellNode() }
  }

}

// MARK: - TableNode Delegate

extension CardDetailController: ASTableDelegate {
  
  func tableNode(_ tableNode: ASTableNode, constrainedSizeForRowAt indexPath: IndexPath) -> ASSizeRange {
    return ASSizeRange(
        min: CGSize(width: UIScreen.main.bounds.width-32, height: 50),
        max: CGSize(width: UIScreen.main.bounds.width, height: 50)
    )
  }
}

