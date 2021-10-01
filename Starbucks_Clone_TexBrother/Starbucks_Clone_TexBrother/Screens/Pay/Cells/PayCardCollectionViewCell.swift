//
//  PayCardCollectionViewCell.swift
//  Starbucks_Clone_TexBrother
//
//  Created by 노한솔 on 2021/09/29.
//

import UIKit

import AsyncDisplayKit

// MARK: - PayCardCollectionViewCell

final class PayCardCollectionViewCell: ASCellNode {

    // MARK: - Components
    
    private let cardImageNode: ASImageNode = {
       let node = ASImageNode()
        node.style.preferredSize = CGSize(width: 296, height: 186)
        return node
    }()
    
    private let titleLabelNode: ASTextNode = {
        let node = ASTextNode()
        return node
    }()
    
    private let favoriteImageView: ASImageNode = {
        let node = ASImageNode()
        node.image = UIImage(named: "favoriteIcon")
        node.style.preferredSize = CGSize(width: 21, height: 21)
        return node
    }()
    
    private let priceLabelNode: ASTextNode = {
        let node = ASTextNode()
        return node
    }()
    
    private let barcodeImageNode: ASImageNode = {
        let node = ASImageNode()
        node.image = UIImage(named: "barcode")
        return node
    }()
    
    private let cardNumberTextNode: ASTextNode = {
        let node = ASTextNode()
        node.attributedText = NSAttributedString(
            string: "****-****-**36-6582",
            attributes:
                [.font: UIFont.systemFont(ofSize: 15, weight: .regular),
                 .foregroundColor: UIColor.black
                ]
        )
        return node
    }()
    
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
    
    private let autoChargeContainerNode: ASDisplayNode = {
       let node = ASDisplayNode()
        node.backgroundColor = .clear
        return node
    }()
    
    private let autoChargeImageNode: ASImageNode = {
        let node = ASImageNode()
        node.image = UIImage(named: "autoChargeIcon")
        node.style.preferredSize = CGSize(width: 27.5, height: 21.3)
        return node
    }()
    
    private let autoChargeTextNode: ASTextNode = {
        let node = ASTextNode()
        node.attributedText = NSAttributedString(
            string: "자동 충전",
            attributes:
                [.font: UIFont.systemFont(ofSize: 12, weight: .semibold),
                 .foregroundColor: UIColor.black
                ]
        )
        return node
    }()
    
    private let generalChargeContainerView: ASDisplayNode = {
       let node = ASDisplayNode()
        node.backgroundColor = .clear
        return node
    }()
    
    private let generalChargeImageNode: ASImageNode = {
        let node = ASImageNode()
        node.image = UIImage(named: "generalChargeIcon")
        node.style.preferredSize = CGSize(width: 27.5, height: 21.3)
        return node
    }()
    
    private let generalChargeTextNode: ASTextNode = {
        let node = ASTextNode()
        node.attributedText = NSAttributedString(
            string: "일반 충전",
            attributes:
                [.font: UIFont.systemFont(ofSize: 12, weight: .semibold),
                 .foregroundColor: UIColor.black
                ]
        )
        return node
    }()
    
    // MARK: - LifeCycles
    
    override init() {
        super.init()
        self.automaticallyManagesSubnodes = true
        self.automaticallyRelayoutOnSafeAreaChanges = true
    }
}

// MARK: - Extensions

extension PayCardCollectionViewCell {
    
    // MARK: - Layout Helpers
    
    override func layoutSpecThatFits(_ constrainedSize: ASSizeRange) -> ASLayoutSpec {
        cardImageNode.style.spacingAfter = 26
        titleLabelNode.style.spacingAfter = 2
        priceLabelNode.style.spacingAfter = 13
        barcodeImageNode.style.spacingAfter = 6
        cardNumberTextNode.style.spacingAfter = 8
        validationLayoutSpec().style.spacingAfter = 33
        
        let layout = ASStackLayoutSpec(
            direction: .vertical,
            spacing: 0,
            justifyContent: .center,
            alignItems: .center,
            children: [
                cardImageNode,
                titleLabelNode,
                priceLabelNode,
                barcodeImageNode,
                cardNumberTextNode,
                validationLayoutSpec(),
                chargeLayoutSpec()
            ]
        )
        return layout
    }
    
    private func autoChargeLayoutSpec() -> ASLayoutSpec {
        autoChargeContainerNode.addSubnode(autoChargeImageNode)
        autoChargeContainerNode.addSubnode(autoChargeTextNode)
        let layout = ASStackLayoutSpec(
            direction: .vertical,
            spacing: 11.6,
            justifyContent: .center,
            alignItems: .center,
            children: [autoChargeImageNode, autoChargeTextNode]
        )
        return layout
    }
    
    private func generalChargeLayoutSpec() -> ASLayoutSpec {
        generalChargeContainerView.addSubnode(generalChargeImageNode)
        generalChargeContainerView.addSubnode(generalChargeTextNode)
        let layout = ASStackLayoutSpec(
            direction: .vertical,
            spacing: 11.6,
            justifyContent: .center,
            alignItems: .center,
            children: [generalChargeImageNode, generalChargeTextNode]
        )
        return layout
    }
    
    private func chargeLayoutSpec() -> ASLayoutSpec {
        let layout = ASStackLayoutSpec(
            direction: .horizontal,
            spacing: 83,
            justifyContent: .spaceAround,
            alignItems: .center,
            children: [autoChargeLayoutSpec(), generalChargeLayoutSpec()]
        )
        return layout
    }
    
    private func validationLayoutSpec() -> ASLayoutSpec {
        let layout = ASStackLayoutSpec(
            direction: .horizontal,
            spacing: 3,
            justifyContent: .center,
            alignItems: .center,
            children: [validationTitleLabelNode, validationLabelNode]
        )
        return layout
    }
    
    // MARK: - General Helpers
    
    func dataBind(cardImage: String, title: String, price: String, isFavorite: Bool) {
        cardImageNode.image = UIImage(named: cardImage)
        titleLabelNode.attributedText = NSAttributedString(
            string: title,
            attributes: [
                .font: UIFont.systemFont(ofSize: 13, weight: .semibold),
                .foregroundColor: UIColor.black
            ]
        )
        
        priceLabelNode.attributedText = NSAttributedString(
            string: price,
            attributes: [
                .font: UIFont.systemFont(ofSize: 23, weight: .regular),
                .foregroundColor: UIColor.black
            ]
        )
    }
}
