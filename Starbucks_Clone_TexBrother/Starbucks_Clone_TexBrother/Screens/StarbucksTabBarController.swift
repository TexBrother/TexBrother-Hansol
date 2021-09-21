//
//  StarbucksTabBarController.swift
//  Starbucks_Clone_TexBrother
//
//  Created by 노한솔 on 2021/09/21.
//

import UIKit

import AsyncDisplayKit

// MARK: - StarbucksTabBarController

final class StarbucksTabBarController: ASTabBarController {
    
    // MARK: - Variables
    
    var defaultIndex = 0 {
        didSet {
            self.selectedIndex = defaultIndex
        }
    }
    
    // MARK: - LifeCycles
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.selectedIndex = defaultIndex
        config()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        setupTabBar()
    }
}

// MARK: - Extensions

extension StarbucksTabBarController {
    
    // MARK: - Helpers
    
    private func setupTabBar() {
        let homeNC = ViewController()
        let homeNavi = ASNavigationController(rootViewController: homeNC)
        
        let payNC = PayNodeController()
        let payNavi = ASNavigationController(rootViewController: payNC)
        
        let orderNC = ViewController()
        let orderNavi = ASNavigationController(rootViewController: orderNC)
        
        let giftNC = ViewController()
        let giftNavi = ASNavigationController(rootViewController: giftNC)
        
        let otherNC = ViewController()
        let otherNavi = ASNavigationController(rootViewController: otherNC)
        
        let naviControllers = [homeNavi, payNavi, orderNavi, giftNavi, otherNavi]
        self.setViewControllers(naviControllers, animated: true)
    }
    
    private func config() {
        tabBar.isTranslucent = false
        tabBar.tintColor = .systemGreen
    }
}
