//
//  KakaoFriendCellNode.swift
//  BasicExercise
//
//  Created by 노한솔 on 2021/08/25.
//

import Foundation

import AsyncDisplayKit
import SwiftyColor

// MARK: - KakaoFriendCellNode

final class KakaoFriendCellNode: ASCellNode  {
  
  // MARK: - Components
  
  private lazy var userProfileImageNode = { () -> ASImageNode in
    
    let node = ASImageNode()
    node.style.preferredSize = CGSize(width: 44.0, height: 44.0)
    node.contentMode = .scaleAspectFit
    return node
  }()
  
  private lazy var userNameTextNode = ASTextNode()
  private lazy var userMessageTextNode = ASTextNode()
  
  // MARK: - Initializing
  
  init(model: KakaoFriendsModel) {
    super.init()
    self.dataBind(userModel: model)
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
    
    return imageAndTextNodesStackLayoutSpec()
    
  }
  
  private func textNodesStackLayoutSpec() -> ASLayoutSpec {
    
    let stackLayout = ASStackLayoutSpec(
      direction: .vertical,
      spacing: 2,
      justifyContent: .start,
      alignItems: .start,
      children: [userNameTextNode, userMessageTextNode])
    
    return stackLayout
  }
  
  private func imageAndTextNodesStackLayoutSpec() -> ASLayoutSpec {
    let stackLayout = ASStackLayoutSpec(
      direction: .horizontal,
      spacing: 11,
      justifyContent: .start,
      alignItems: .center,
      children: [imageNodeRatioLayoutSpec(), textNodesStackLayoutSpec()])
    
    return stackLayout
  }
  
  private func imageNodeRatioLayoutSpec() -> ASLayoutSpec {
    
    return ASRatioLayoutSpec(ratio: 1.0, child: userProfileImageNode).styled {
      $0.flexShrink = 1.0
      $0.width = ASDimension(unit: .points, value: 44.0)
    }
  }
  
  // MARK: - General Helpers
  
  func dataBind(userModel: KakaoFriendsModel) {
    userProfileImageNode.image = UIImage(named: userModel.profileImageName)
    
    userNameTextNode.attributedText = NSAttributedString(
      string: userModel.profileNameText,
      attributes: userNameAttribute)
    
    userMessageTextNode.attributedText = NSAttributedString(
      string: userModel.profileMessageText,
      attributes: userMessageAttribute)
  }
}

// MARK: - Extensions

extension KakaoFriendCellNode {
  
  // MARK: - Attributes
  private var userNameAttribute: [NSAttributedString.Key: Any] {
    return [.foregroundColor: UIColor.black,
            .font: UIFont.systemFont(ofSize: 12, weight: .semibold)
    ]
  }
  
  private var userMessageAttribute: [NSAttributedString.Key: Any] {
    return [.foregroundColor: UIColor.gray,
            .font: UIFont.systemFont(ofSize: 11, weight: .regular)
    ]
  }
}
