//
//  TestNodeController.swift
//  BasicExercise
//
//  Created by 노한솔 on 2021/08/11.
//

import UIKit

import AsyncDisplayKit

final class TestNodeController: ASDKViewController<TestNode> {

  // MARK: Initializing
  
  override init() {
    super.init(node: TestNode())
    self.node.backgroundColor = .white
  }

  required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
}
