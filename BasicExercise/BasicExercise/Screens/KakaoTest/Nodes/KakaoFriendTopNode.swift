//
//  KakaoFriendTopNode.swift
//  BasicExercise
//
//  Created by 노한솔 on 2021/08/25.
//

import Foundation

import AsyncDisplayKit
import SwiftyColor

// MARK: - KakaoFriendTopNode

final class KakaoFriendTopNode: ASDisplayNode {
  
  // MARK: - Components
  
  private let friendTitleLabelNode: ASTextNode = {
    
    let node = ASTextNode()
    node.attributedText = NSAttributedString(
      string: "친구",
      attributes: [.font: UIFont.systemFont(ofSize: 22, weight: .semibold)])
    
    return node
  }()
  
  private let settingIconImageNode: ASImageNode = {
    
    let node = ASImageNode()
    node.image = UIImage(named: "settingIcon")
    node.contentMode = .scaleAspectFit
    return node
  }()
  
  // MARK: - Initializing
  
  override init() {
    super.init()
    self.automaticallyManagesSubnodes = true
    self.automaticallyRelayoutOnSafeAreaChanges = true
  }
  
  // MARK: - Main Thread
  
  override func layout() {
    super.layout()
    self.backgroundColor = .clear
  }
  
  // MARK: - Layout
  
  override func layoutSpecThatFits(_ constrainedSize: ASSizeRange) ->
  ASLayoutSpec {
    
    let stackLayout = ASStackLayoutSpec(
      direction: .horizontal,
      spacing: 0.0,
      justifyContent: .spaceBetween,
      alignItems: .stretch,
      children: [friendTitleLabelNode, imageNodeRatioLayoutSpec()])
    
    return stackLayout
  }
  
  private func imageNodeRatioLayoutSpec() -> ASLayoutSpec {
    
    return ASRatioLayoutSpec(ratio: 1.0, child: settingIconImageNode).styled {
      $0.flexShrink = 1.0
      $0.width = ASDimension(unit: .points, value: 19.0)
    }
  }
}
