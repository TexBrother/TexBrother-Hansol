//
//  AppstoreMainImageNode.swift
//  BasicExercise
//
//  Created by 노한솔 on 2021/08/18.
//

import Foundation

import AsyncDisplayKit

// MARK: - AppstoreMainImageNode

final class AppstoreMainImageNode: ASImageNode {
  
  // MARK: - Components
  
  private let firstTitleNode: ASTextNode = {
    let node = ASTextNode()
    node.attributedText =
      NSAttributedString(
        string: "고르고 골랐어요",
        attributes: [.foregroundColor: 0x8a8a8f.color,
                     .font: UIFont.systemFont(ofSize: 14, weight: .bold)])
    return node
  }()
  
  private let secondTitleNode: ASTextNode = {
    let node = ASTextNode()
    node.attributedText =
      NSAttributedString(
        string: "이번 주 추천 앱",
        attributes: [.foregroundColor: 0xffffff.color,
                     .font: UIFont.systemFont(ofSize: 24, weight: .bold)])
    return node
  }()
  
  private let thirdTitleNode: ASTextNode = {
    let node = ASTextNode()
    node.attributedText =
      NSAttributedString(
        string: "새로 나온 앱과 업데이트를 모았습니다.",
        attributes: [.foregroundColor: 0x8a8a8f.color,
                     .font: UIFont.systemFont(ofSize: 11, weight: .medium)])
    return node
  }()
  
  // MARK: - Initializing
  
  override init() {
    super.init()
    self.automaticallyManagesSubnodes = true
    self.automaticallyRelayoutOnSafeAreaChanges = true
    self.style.width = ASDimension(unit: .points, value: 335.0)
    self.layoutSpecBlock = { (_ , _) -> ASLayoutSpec in
      return self.layoutSpec()
      
    }
  }
  
  
  // MARK: - Node Life Cycle
  
  override func layout() {
    super.layout()
    self.image = UIImage(named: "appstoreBanner1")
    self.contentMode = .scaleAspectFit
  }
  
  // MARK: - Layout
  private func layoutSpec() -> ASLayoutSpec {
    let absoluteLayoutSpec = ASAbsoluteLayoutSpec(
      sizing: .default,
      children: [self.topTextNodesInsetLayoutSpec(),
                 self.bottomTextNodesInsetLayoutSpec()])
    
    return ASRatioLayoutSpec (ratio: 1.0, child: absoluteLayoutSpec)
  }
  
  private func topTextNodesInsetLayoutSpec() -> ASLayoutSpec {
    let insets = UIEdgeInsets(top: 16.0, left: 20.0, bottom: 0.0, right: 0.0)
    let insetLayoutSpec = ASInsetLayoutSpec(insets: insets, child: topTextNodesStackLayoutSpec())
    
    return ASRelativeLayoutSpec (
      horizontalPosition: .start,
      verticalPosition: .start,
      sizingOption: [],
      child: insetLayoutSpec)
  }
  
  private func topTextNodesStackLayoutSpec() -> ASLayoutSpec {
    let stackLayout = ASStackLayoutSpec(
      direction: .vertical,
      spacing: 5.0,
      justifyContent: .start,
      alignItems: .start,
      children: [firstTitleNode, secondTitleNode])
    return stackLayout
  }
  
  private func bottomTextNodesInsetLayoutSpec() -> ASLayoutSpec {
    let insets = UIEdgeInsets(top: 0.0, left: 20.0, bottom: 15.0, right: 0.0)
    let insetLayoutSpec = ASInsetLayoutSpec(insets: insets, child: thirdTitleNode)
    
    return ASRelativeLayoutSpec (
      horizontalPosition: .start,
      verticalPosition: .end,
      sizingOption: [],
      child: insetLayoutSpec)
  }
}
