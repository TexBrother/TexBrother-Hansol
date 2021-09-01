//
//  LoginNodeController.swift
//  BasicExercise
//
//  Created by 노한솔 on 2021/08/11.
//

import UIKit

import AsyncDisplayKit

final class LoginNodeController: ASDKViewController<LoginNode> {

  // MARK: Initializing
  
  override init() {
    super.init(node: LoginNode())
    self.node.backgroundColor = .white
  }

  required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
}
