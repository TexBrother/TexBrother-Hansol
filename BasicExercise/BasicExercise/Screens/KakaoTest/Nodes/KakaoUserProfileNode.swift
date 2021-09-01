//
//  KakaoUserProfileNode.swift
//  BasicExercise
//
//  Created by 노한솔 on 2021/08/25.
//

import Foundation

import AsyncDisplayKit
import SwiftyColor

// MARK: - KakaoUserProfileNode

final class KakaoUserProfileNode: ASDisplayNode  {
  
  // MARK: - Components
  
  private let userProfileImageNode: ASImageNode = {
    
    let node = ASImageNode()
    node.image = UIImage(named: "friendtabProfileImg")
    node.contentMode = .scaleAspectFit
    return node
  }()
  
  private let userNameTextNode: ASTextNode = {
    
    let node = ASTextNode()
    node.attributedText = NSAttributedString(
      string: "노한솔",
      attributes: [.font: UIFont.systemFont(ofSize: 16, weight: .semibold),
                   .foregroundColor: UIColor.black])
    
    return node
  }()
  
  private let userMessageTextNode: ASTextNode = {
    
    let node = ASTextNode()
    node.attributedText = NSAttributedString(
      string: "텍스쳐 텍스형 텍수쳐 텍수칠때떠나라 김텍수",
      attributes: [.font: UIFont.systemFont(ofSize: 11, weight: .regular),
                   .foregroundColor: UIColor.gray])
    
    return node
  }()
  
  private let separatorView: ASDisplayNode = {
    
    let node = ASDisplayNode()
    node.backgroundColor = .lightGray
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
  
  override func layoutSpecThatFits(_ constrainedSize: ASSizeRange) -> ASLayoutSpec {
    
    let stackLayout = ASStackLayoutSpec(
      direction: .horizontal,
      spacing: 10,
      justifyContent: .start,
      alignItems: .center,
      children: [imageNodeRatioLayoutSpec(), textNodesStackLayoutSpec()])
    
    return stackLayout
  }
  
  private func textNodesStackLayoutSpec() -> ASLayoutSpec {
    
    let stackLayout = ASStackLayoutSpec(
      direction: .vertical,
      spacing: 9,
      justifyContent: .start,
      alignItems: .start,
      children: [userNameTextNode, userMessageTextNode])
    
    return stackLayout
  }
  
  private func imageNodeRatioLayoutSpec() -> ASLayoutSpec {
    
    return ASRatioLayoutSpec(ratio: 1.0, child: userProfileImageNode).styled {
      $0.flexShrink = 1.0
      $0.width = ASDimension(unit: .points, value: 59.0)
    }
  }
}



