//
//  AppstoreMainViewController.swift
//  BasicExercise
//
//  Created by 노한솔 on 2021/08/18.
//

import UIKit

import AsyncDisplayKit

// MARK: - AppstoreMainViewController

final class AppstoreMainViewController: ASDKViewController<ASDisplayNode> {
  
  // MARK: - Life Cycles
  
  override init() {
    super.init(node: ASDisplayNode())
    self.node.backgroundColor = .black
    self.node.automaticallyManagesSubnodes = true
    self.node.automaticallyRelayoutOnSafeAreaChanges = true
    self.node.layoutSpecBlock = { [weak self] (node, constraintedSize) -> ASLayoutSpec in
      return self?.layoutSpecThatFits(constraintedSize) ?? ASLayoutSpec()
    }
  }
  
  required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  // MARK: - Layout
  
  private func layoutSpecThatFits(_ constrainedSize: ASSizeRange) -> ASLayoutSpec {
    var contentInset: UIEdgeInsets = self.node.safeAreaInsets
    contentInset.left += 20.0
    contentInset.right += 20.0
    contentInset.top += 20.0
    
    return ASInsetLayoutSpec (
      insets: contentInset,
      child: nodesStackLayoutSpec()
    )
  }
  
  private func nodesStackLayoutSpec() -> ASLayoutSpec {
    let stackLayout = ASStackLayoutSpec(
      direction: .vertical,
      spacing: 5.0,
      justifyContent: .start,
      alignItems: .stretch,
      children: [AppstoreMainTopNode(), AppstoreMainImageNode()])
    return stackLayout
  }
}
