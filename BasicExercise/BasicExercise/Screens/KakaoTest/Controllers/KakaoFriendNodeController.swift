//
//  KakaoFriendNodeController.swift
//  BasicExercise
//
//  Created by 노한솔 on 2021/08/25.
//

import Foundation

import AsyncDisplayKit
import SwiftyColor

// MARK: - KakaoFriendNodeController

final class KakaoFriendNodeController: ASDKViewController<ASDisplayNode> {
  
  // MARK: - Components
  
  private let topNode = KakaoFriendTopNode()
  private let profileNode = KakaoUserProfileNode()
  private let separatorNode: ASDisplayNode = {
    let node = ASDisplayNode()
    node.backgroundColor = .systemGray4
    node.style.height = ASDimension(unit: .points, value: 1.0)
    return node
  }()
  
  private lazy var friendTableNode = { () -> ASTableNode in
    let node = ASTableNode(style: .plain)
    node.delegate = self
    node.dataSource = self
    return node
  }()
  
  // MARK: - Variables
  
  private var friendModel = [
    KakaoFriendsModel(profileImageName: "profileImage1",
                      profileNameText: "일땡",
                      profileMessageText: "랜디스도넛"),
    KakaoFriendsModel(profileImageName: "profileImage2",
                      profileNameText: "이땡",
                      profileMessageText: "노티드도넛"),
    KakaoFriendsModel(profileImageName: "profileImage3",
                      profileNameText: "삼땡",
                      profileMessageText: "타이거쿠키"),
    KakaoFriendsModel(profileImageName: "profileImage4",
                      profileNameText: "사땡",
                      profileMessageText: "카페 레이어드"),
    KakaoFriendsModel(profileImageName: "profileImage5",
                      profileNameText: "오땡",
                      profileMessageText: "리플로우 커피 로스터스"),
    KakaoFriendsModel(profileImageName: "profileImage6",
                      profileNameText: "육땡",
                      profileMessageText: "호랑이커피"),
    KakaoFriendsModel(profileImageName: "profileImage7",
                      profileNameText: "칠땡",
                      profileMessageText: "라라브레드"),
    KakaoFriendsModel(profileImageName: "profileImage8",
                      profileNameText: "팔땡",
                      profileMessageText: "카페 마호가니")]
  
  // MARK: - LifeCycles
  
  override init() {
    super.init(node: ASDisplayNode())
    self.node.automaticallyManagesSubnodes = true
    self.node.automaticallyRelayoutOnSafeAreaChanges = true
    self.node.style.flexGrow = 1.0
    self.node.style.flexShrink = 1.0
    self.node.layoutSpecBlock = { [weak self] (node, constraintedSize) -> ASLayoutSpec in
      return self?.layoutSpecThatFits(constraintedSize) ?? ASLayoutSpec()
    }
  }
   
  required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  // MARK: - Main Thread
  
  override func viewDidLoad() {
    super.viewDidLoad()
    self.node.backgroundColor = .clear
    self.friendTableNode.view.separatorStyle = .none
    self.friendTableNode.view.showsVerticalScrollIndicator = false
  }
}

// MARK: - Extensions

extension KakaoFriendNodeController {
  
  // MARK: - Layout Helpers
  
  private func layoutSpecThatFits(_ constrainedSize: ASSizeRange) -> ASLayoutSpec {
    return ASInsetLayoutSpec(
        insets: UIEdgeInsets(
            top: 56,
            left: 14,
            bottom: 0,
            right: 14),
        child: subnodesStackLayoutSpec())
  }
  
  private func subnodesStackLayoutSpec() -> ASLayoutSpec {
    topNode.style.spacingAfter = 21
    profileNode.style.spacingAfter = 10
    
    let stackLayout = ASStackLayoutSpec(
      direction: .vertical,
      spacing: 0.0,
      justifyContent: .start,
      alignItems: .stretch,
      children: [topNode,
                 profileNode,
                 separatorNode,
                 friendTableNode.styled({
                  $0.flexGrow = 1.0
                 })])
    
    return stackLayout
    
  }
  
}

// MARK: - TableNode DataSource

extension KakaoFriendNodeController: ASTableDataSource {
  
  func numberOfSections(in tableNode: ASTableNode) -> Int {
    return 1
  }
  
  func tableNode(_ tableNode: ASTableNode, numberOfRowsInSection section: Int) -> Int {
    return self.friendModel.count
  }
  
  func tableNode(_ tableNode: ASTableNode, nodeBlockForRowAt indexPath: IndexPath) -> ASCellNodeBlock {
    
    guard friendModel.count > indexPath.row else { return { ASCellNode() } }

    let friend = self.friendModel[indexPath.row]

    let cellNodeBlock = { () -> ASCellNode in
        let cellNode = KakaoFriendCellNode(model: friend)
      return cellNode
    }

    return cellNodeBlock
  }

}

// MARK: - TableNode Delegate

extension KakaoFriendNodeController: ASTableDelegate {
  
  func tableNode(_ tableNode: ASTableNode, constrainedSizeForRowAt indexPath: IndexPath) -> ASSizeRange {
    return ASSizeRange(
        min: CGSize(width: UIScreen.main.bounds.width-32, height: 50),
        max: CGSize(width: UIScreen.main.bounds.width, height: 50)
    )
  }
}
