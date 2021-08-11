//
//  TestNode.swift
//  BasicExercise
//
//  Created by 노한솔 on 2021/08/11.
//

import Foundation

import AsyncDisplayKit

final class TestNode: ASDisplayNode {

  // MARK: UI
  
  private let imageNode: ASImageNode = {
    let node = ASImageNode()
    node.image = UIImage(named: "image")
    node.borderColor = UIColor.gray.cgColor
    node.borderWidth = 1.0
    node.cornerRadius = 15.0
    node.contentMode = .scaleAspectFit
    return node
  }()

  private let titleNode: ASTextNode = {
    let node = ASTextNode()
    let paragraphStyle = NSMutableParagraphStyle()
    paragraphStyle.alignment = .center
    node.attributedText = NSAttributedString(
      string: "Welcome to Texture-KR",
      attributes: [
        .font: UIFont.boldSystemFont(ofSize: 15.0),
        .foregroundColor: UIColor.gray,
        .paragraphStyle: paragraphStyle
      ]
    )
    return node
  }()
  
  
  // MARK: Initializing

  override init() {
    super.init()
    self.automaticallyManagesSubnodes = true
    self.automaticallyRelayoutOnSafeAreaChanges = true
  }
  
  
  // MARK: Node Life Cycle

  override func layout() {
    super.layout()
    self.imageNode.cornerRadius = 15.0
  }
  
  
  // MARK: Layout

  override func layoutSpecThatFits(_ constraintedSize: ASSizeRange) -> ASLayoutSpec {
    var containerInsets: UIEdgeInsets = self.safeAreaInsets
    containerInsets.left += 15.0
    containerInsets.right += 15.0
    containerInsets.top = containerInsets.bottom

    return ASInsetLayoutSpec(
      insets: containerInsets,
      child: self.contentLayoutSpec()
    )
  }

  private func contentLayoutSpec() -> ASLayoutSpec {
    return ASStackLayoutSpec(
      direction: .vertical,
      spacing: 10.0,
      justifyContent: .center,
      alignItems: .center,
      children: [
        self.imageLayoutSpec(),
        self.titleNode
      ]
    )
  }

  private func imageLayoutSpec() -> ASLayoutSpec {
    return ASRatioLayoutSpec(ratio: 1.0, child: self.imageNode).styled {
      $0.flexShrink = 1.0
    }
  }
}
