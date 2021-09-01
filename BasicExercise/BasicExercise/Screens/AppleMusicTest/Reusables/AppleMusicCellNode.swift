//
//  AppleMusicCellNode.swift
//  BasicExercise
//
//  Created by 노한솔 on 2021/09/01.
//

import Foundation

import AsyncDisplayKit
import SwiftyColor

// MARK: - AppleMusicCellNode

final class AppleMusicCellNode: ASCellNode  {
    
    // MARK: - Components
    
    private lazy var musicAlbumImageNode = { () -> ASImageNode in
        
        let node = ASImageNode()
        
        node.style.preferredSize = CGSize(width: 165.0, height: 165.0)
        node.contentMode = .scaleAspectFit
        node.style.flexShrink = 1.0
        
        return node
    }()
    
    private let musicTitleTextNode = ASTextNode()
    private let singerTextNode = ASTextNode()
    
    // MARK: - Initializing
    
    init(model: MusicModel) {
        super.init()
        self.dataBind(model: model)
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
        
        musicAlbumImageNode.style.spacingAfter = 4
        musicTitleTextNode.style.spacingAfter = 3
        
        let stackLayout = ASStackLayoutSpec(direction: .vertical,
                                            spacing: 0,
                                            justifyContent: .start,
                                            alignItems: .start,
                                            children: [
                                                musicAlbumImageNode,
                                                musicTitleTextNode,
                                                singerTextNode])
        
        return stackLayout
    }
    
    // MARK: - General Helpers
    
    func dataBind(model: MusicModel) {
        
        musicAlbumImageNode.image = UIImage(named: model.musicAlbumTitle)
        
        musicTitleTextNode.attributedText = NSAttributedString(
            string: model.musicTitle,
            attributes: musicTitleAttribute)
        
        singerTextNode.attributedText = NSAttributedString(
            string: model.singerName,
            attributes: singerNameAttribute)
    }
}

// MARK: - Extensions

extension AppleMusicCellNode {
    
    // MARK: - Attributes
    private var musicTitleAttribute: [NSAttributedString.Key: Any] {
        return [
            .foregroundColor: UIColor.white,
            .font: UIFont.systemFont(ofSize: 11, weight: .regular)
        ]
    }
    
    private var singerNameAttribute: [NSAttributedString.Key: Any] {
        return [
            .foregroundColor: UIColor.lightGray,
            .font: UIFont.systemFont(ofSize: 10, weight: .regular)
        ]
    }
}



