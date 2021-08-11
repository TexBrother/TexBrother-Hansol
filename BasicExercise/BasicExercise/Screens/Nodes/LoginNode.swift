//
//  LoginNode.swift
//  BasicExercise
//
//  Created by 노한솔 on 2021/08/11.
//
import Foundation

import AsyncDisplayKit

final class LoginNode: ASDisplayNode {
  
  // MARK: UI
  
  private let containerNode: ASDisplayNode = {
    let node = ASDisplayNode()
    node.backgroundColor = .clear
    return node
  }()
  
  private let logoImageNode: ASImageNode = {
    let node = ASImageNode()
    node.image = UIImage(named: "image")
    node.contentMode = .scaleAspectFill
    return node
  }()
  
  private let emailTextNode: ASTextNode = {
    let node = ASTextNode()
    node.attributedText = NSAttributedString(
      string: "이메일 아이디",
      attributes: [.font: UIFont.boldSystemFont(ofSize: 16),
                   .foregroundColor: UIColor.brown])
    return node
  }()
  
  private let emailEditableTextNode: ASEditableTextNode = {
    let node = ASEditableTextNode()
    node.attributedText =
      NSAttributedString(
        string: "",
        attributes: [.foregroundColor: UIColor.black,
                     .font: UIFont.systemFont(ofSize: 16, weight: .regular)])
    node.attributedPlaceholderText =
      NSAttributedString(string: "yourname@example.com",
                         attributes: [.foregroundColor: UIColor.gray])
    return node
  }()
  
  private let passwordTextNode: ASTextNode = {
    let node = ASTextNode()
    node.attributedText = NSAttributedString(
      string: "비밀번호",
      attributes: [.font: UIFont.boldSystemFont(ofSize: 16),
                   .foregroundColor: UIColor.brown])
    return node
  }()
  
  private let passwordEditableTextNode: ASEditableTextNode = {
    let node = ASEditableTextNode()
    node.attributedText =
      NSAttributedString(
        string: "",
        attributes: [.foregroundColor: UIColor.black,
                     .font: UIFont.systemFont(ofSize: 16, weight: .regular)])
    node.attributedPlaceholderText = NSAttributedString(
      string: "yourpassword",
      attributes: [.foregroundColor: UIColor.gray])
    return node
  }()
  
  private let loginButtonNode: ASButtonNode = {
    let node = ASButtonNode()
    node.setTitle("로그인",
                  with: .systemFont(ofSize: 16, weight: .regular),
                  with: .white,
                  for: .normal)
    node.backgroundColor = .gray
    node.cornerRadius = 24.5
    return node
  }()
  
  private let findPasswordTextNode: ASTextNode = {
    let node = ASTextNode()
    node.attributedText = NSAttributedString(
      string: "비밀번호",
      attributes: [.font: UIFont.boldSystemFont(ofSize: 14),
                   .foregroundColor: UIColor.gray])
    return node
  }()
  
  private let signinTextNode: ASTextNode = {
    let node = ASTextNode()
    node.attributedText = NSAttributedString(
      string: "회원가입",
      attributes: [.font: UIFont.boldSystemFont(ofSize: 14),
                   .foregroundColor: UIColor.gray])
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
  }
  
  
  // MARK: Layout
  override func layoutSpecThatFits(_ constrainedSize: ASSizeRange) -> ASLayoutSpec {
    let insets = UIEdgeInsets(top: 126, left: 46, bottom: .infinity, right: 46)
    
    return ASInsetLayoutSpec(insets: insets, child: ImageAndTextLayoutSpec())
  }
  
  private func logoImageNodeLayoutSpec() -> ASLayoutSpec {
    let insets = UIEdgeInsets(top: 0, left: 90, bottom: 0, right: 90)
    
    return ASInsetLayoutSpec(insets: insets,
                             child: logoImageNode.styled {
                              $0.height = ASDimension(unit: .points, value: 105.0)
                             })
  }
  
  private func emailNodeLayoutSpec() -> ASLayoutSpec {
    let stackLayout = ASStackLayoutSpec(
      direction: .vertical,
      spacing: 10.0,
      justifyContent: .start,
      alignItems: .start,
      children: [emailTextNode, emailEditableTextNode])
    return stackLayout
  }
  
  private func passwordNodeLayoutSpec() -> ASLayoutSpec {
    let stackLayout = ASStackLayoutSpec(direction: .vertical,
                                        spacing: 10.0,
                                        justifyContent: .start,
                                        alignItems: .start,
                                        children: [passwordTextNode, passwordEditableTextNode])
    return stackLayout
  }
  
  private func editableTextNodeLayoutSpec() -> ASLayoutSpec {
    let stackLayout = ASStackLayoutSpec(direction: .vertical,
                                        spacing: 34.0,
                                        justifyContent: .start,
                                        alignItems: .start,
                                        children: [emailNodeLayoutSpec(),
                                                   passwordNodeLayoutSpec()])
    return stackLayout
  }
  
  private func buttonNodeLayoutSpec() -> ASLayoutSpec {
    let stackLayout = ASStackLayoutSpec(direction: .horizontal,
                                        spacing: 18.0,
                                        justifyContent: .center,
                                        alignItems: .stretch,
                                        children: [findPasswordTextNode, signinTextNode])
    return stackLayout
  }
  
  private func loginButtonNodeLayoutSpec() -> ASLayoutSpec {
    let insets = UIEdgeInsets(top: 0, left: 78, bottom: 0, right: 78)
    return ASInsetLayoutSpec(insets: insets,
                             child: self.loginButtonNode)
  }
  
  private func loginAndButtonsLayoutSpec() -> ASLayoutSpec {
    let stackLayout = ASStackLayoutSpec(direction: .vertical,
                                         spacing: 17.0,
                                         justifyContent: .center,
                                         alignItems: .center,
                                         children: [loginButtonNodeLayoutSpec(),
                                                    buttonNodeLayoutSpec()])
    return stackLayout
  }
  
  private func TextAndButtonLayoutSpec() -> ASLayoutSpec {
    let stackLayout = ASStackLayoutSpec(direction: .vertical,
                                         spacing: 44.0,
                                         justifyContent: .center,
                                         alignItems: .center,
                                         children: [editableTextNodeLayoutSpec(),
                                                    loginAndButtonsLayoutSpec()])
    return stackLayout
  }
  
  private func ImageAndTextLayoutSpec() -> ASLayoutSpec {
    let stackLayout = ASStackLayoutSpec(direction: .vertical,
                                         spacing: 84.0,
                                         justifyContent: .center,
                                         alignItems: .center,
                                         children: [logoImageNodeLayoutSpec(),
                                                    TextAndButtonLayoutSpec()])
    return stackLayout
  }
}
