//
//  ViewController.swift
//  BasicExercise
//
//  Created by 노한솔 on 2021/08/04.
//

import UIKit

import AsyncDisplayKit

// MARK: - ViewController
class ViewController: ASDKViewController<ASDisplayNode> {
  
  // MARK: - Components
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
    node.attributedPlaceholderText = NSAttributedString(string: "yourname@example.com", attributes: [.foregroundColor: UIColor.gray])
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
    node.attributedPlaceholderText = NSAttributedString(string: "yourpassword", attributes: [.foregroundColor: UIColor.gray])
    return node
  }()
  
  private let loginButtonNode: ASButtonNode = {
    let node = ASButtonNode()
    node.setTitle("로그인", with: .systemFont(ofSize: 16, weight: .regular), with: .white, for: .normal)
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
  
  // MARK: - Initializing
  override init() {
    super.init(node: ASDisplayNode())
    self.node.backgroundColor = .white
    self.node.automaticallyManagesSubnodes = true
    self.node.automaticallyRelayoutOnSafeAreaChanges = true
    self.node.layoutSpecBlock = {
      [weak self] (node, constraintedSize) -> ASLayoutSpec in
      return self?.layoutSpecThatFits(constraintedSize) ?? ASLayoutSpec()
    }
  }
  
  required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  
  // MARK: - Layout
  private func layoutSpecThatFits(_ constraintedSize: ASSizeRange) -> ASLayoutSpec {
    var containerInsets = UIEdgeInsets(top: 130, left: 136, bottom: .infinity, right: 136)
    return ASInsetLayoutSpec(
      insets: containerInsets,
      child: self.logoWithEmailLayoutSpec()
    )
  }
  
  private func logoWithEmailLayoutSpec() -> ASLayoutSpec {
    let layout = ASStackLayoutSpec(
      direction: .vertical,
      spacing: 84,
      justifyContent: .center,
      alignItems: .center,
      children: [self.logoImageNode, self.textLayout()])
    return layout
  }
  
  private func emailLayout() -> ASLayoutSpec {
    let layout = ASStackLayoutSpec(
      direction: .vertical,
      spacing: 10,
      justifyContent: .start,
      alignItems: .start,
      children: [self.emailTextNode, self.emailEditableTextNode])
    return layout
  }
  
  private func passwordLayout() -> ASLayoutSpec {
    let layout = ASStackLayoutSpec(
      direction: .vertical,
      spacing: 10,
      justifyContent: .start,
      alignItems: .start,
      children: [self.passwordTextNode, self.passwordEditableTextNode])
    return layout
  }
  
  private func textLayout() -> ASLayoutSpec {
    let layout = ASStackLayoutSpec(
      direction: .vertical,
      spacing: 34,
      justifyContent: .start,
      alignItems: .start,
      children: [self.emailLayout(), self.passwordLayout()])
    return layout
  }
}

