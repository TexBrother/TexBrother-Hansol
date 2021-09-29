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
    
    private lazy var cardCollectionNode = { () -> ASCollectionNode in
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        
        let node = ASCollectionNode(frame: .zero, collectionViewLayout: layout)
        node.isPagingEnabled = true
        return node
    }()
    
    // MARK: - Components
    
    private let navigationView: CustomNavigationBar = {
        let node = CustomNavigationBar()
        node.setupBar(isBackButton: false, right: "listIcon")
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
        node.setBackgroundImage(UIImage(named: "banner"), for: .normal)
        node.style.height = ASDimension(unit: .points, value: 60)
        return node
    }()
    
    // MARK: - Variables
    
    var cardList: [CardModel] = [
        CardModel(cardImageName: "thankYouCard", title: "Thank You 카드", price: "2,300원"),
        CardModel(cardImageName: "limitedCard", title: "2021 한정 카드", price: "32,000원")
    ]
    
    // MARK: - Background Thread
    
    override init() {
        super.init(node: ASScrollNode())
        node.automaticallyManagesSubnodes = true
        node.automaticallyRelayoutOnSafeAreaChanges = true
        cardCollectionNode.delegate = self
        cardCollectionNode.dataSource = self
        node.layoutSpecBlock = { [weak self] (scrollNode, constraintedSize) -> ASLayoutSpec in
            return self?.layoutSpecThatFits(constraintedSize) ?? ASLayoutSpec()
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Main Thread
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}

// MARK: - Extension

extension PayNodeController {
    
    // MARK: - Layout Helpers
    
    private func layoutSpecThatFits(_ constraintedSize: ASSizeRange) -> ASLayoutSpec {
        return ASInsetLayoutSpec(
            insets: UIEdgeInsets(top: 0, left: 20, bottom: 0, right: 20),
            child: componentsLayoutSpec()
        )
    }
    
    private func componentsLayoutSpec() -> ASLayoutSpec {
        navigationView.style.spacingAfter = 22
        titleLabel.style.spacingAfter = 24
        cardCollectionNode.style.spacingAfter = 28
        bannerButton.style.spacingAfter = 20
        
        let layout = ASStackLayoutSpec(
            direction: .vertical,
            spacing: 0,
            justifyContent: .spaceBetween,
            alignItems: .center,
            children: [navigationView, titleLabel, cardCollectionNode, menuView, bannerButton])
        return layout
    }
}

// MARK: - UICollectionViewDelegateFlowLayout

extension PayNodeController: ASCollectionDelegateFlowLayout {
    func collectionNode(_ collectionNode: ASCollectionNode, constrainedSizeForItemAt indexPath: IndexPath) -> ASSizeRange {
        let width = UIScreen.main.bounds.width - 40
        return ASSizeRange(min: .zero, max: CGSize(width: width, height: 475))
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 0, left: 15, bottom: 0, right: 15)
    }
}

extension PayNodeController: ASCollectionDataSource {
    func collectionNode(_ collectionNode: ASCollectionNode, numberOfItemsInSection section: Int) -> Int {
        return cardList.count
    }
    
    func collectionNode(_ collectionNode: ASCollectionNode, nodeBlockForItemAt indexPath: IndexPath) -> ASCellNodeBlock {
        return {
            guard self.cardList.count > indexPath.row else { return ASCellNode() }
            let payCell = PayCardCollectionViewCell()
            payCell.dataBind(
                cardImage: self.cardList[indexPath.item].cardImageName,
                title: self.cardList[indexPath.item].title,
                price: self.cardList[indexPath.item].price,
                isFavorite: false
            )
            return PayCardCollectionViewCell()
        }
    }
}
