//
//  AppstoreMainTopNode.swift
//  BasicExercise
//
//  Created by 노한솔 on 2021/08/18.
//

import Foundation

import AsyncDisplayKit
import SwiftyColor

// MARK: - AppstoreMainTopNode

final class AppstoreMainTopNode: ASDisplayNode {
  
  // MARK: - Components
  
  private let dateLabelNode: ASTextNode = {
    let node = ASTextNode()
    node.attributedText =
      NSAttributedString(
        string: "4월 10일 토요일",
        attributes: [.foregroundColor: 0x8a8a8f.color,
                     .font: UIFont.systemFont(ofSize: 12, weight: .bold)])
    return node
  }()
  
  private let todayLabelNode: ASTextNode = {
    let node = ASTextNode()
    node.attributedText =
      NSAttributedString(
        string: "투데이",
        attributes: [.foregroundColor: 0xffffff.color,
                     .font: UIFont.systemFont(ofSize: 28, weight: .bold)])
    return node
  }()
  
  private let joonImageNode: ASImageNode = {
    let node = ASImageNode()
    node.image = UIImage(named: "appstoreProfileImg")
    node.contentMode = .scaleAspectFit
    node.cornerRadius = 15
    return node
  }()
  
  // MARK: - Initializing
  
  override init() {
    super.init()
    self.automaticallyManagesSubnodes = true
    self.automaticallyRelayoutOnSafeAreaChanges = true
  }
  
  
  // MARK: - Node Life Cycle
  
  override func layout() {
    super.layout()
    self.backgroundColor = .black
  }
  
  // MARK: - Layout
  override func layoutSpecThatFits(_ constrainedSize: ASSizeRange) -> ASLayoutSpec {
    let stackLayout = ASStackLayoutSpec(
      direction: .horizontal,
      spacing: 0.0,
      justifyContent: .spaceBetween,
      alignItems: .baselineLast,
      children: [textNodesLayoutSpec(), imageNodeRatioLayoutSpec()])
    return stackLayout
  }
  
  private func textNodesLayoutSpec() -> ASLayoutSpec {
    let stackLayout = ASStackLayoutSpec(
      direction: .vertical,
      spacing: 2.0,
      justifyContent: .start,
      alignItems: .start,
      children: [dateLabelNode, todayLabelNode])
    return stackLayout
  }
  
  private func imageNodeRatioLayoutSpec() -> ASLayoutSpec {
    return ASRatioLayoutSpec(ratio: 1.0, child: joonImageNode).styled {
      $0.flexShrink = 1.0
      $0.width = ASDimension(unit: .points, value: 30.0)
    }
  }
}
