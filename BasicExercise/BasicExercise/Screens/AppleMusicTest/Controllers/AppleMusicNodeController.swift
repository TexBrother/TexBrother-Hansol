//
//  AppleMusicNodeController.swift
//  BasicExercise
//
//  Created by 노한솔 on 2021/09/01.
//

import Foundation

import AsyncDisplayKit

// MARK: - AppleMusicNodeController

final class AppleMusicNodeController: ASDKViewController<ASDisplayNode> {
    
    // MARK: - Components
    private lazy var musicCollectionNode: ASCollectionNode = {
        
        let flowLayout = UICollectionViewFlowLayout()
        flowLayout.scrollDirection = .vertical
        
        let collectionNode = ASCollectionNode(collectionViewLayout: flowLayout)
        collectionNode.backgroundColor = .clear
        collectionNode.delegate = self
        collectionNode.dataSource = self
        
        return collectionNode
    }()
    
    // MARK: - Components
    
    private var musicModel: [MusicModel] = [
        MusicModel(
            albumImage: "musicAlbum1",
            musicTitle: "가습기",
            singerName: "한요한"),
        MusicModel(
            albumImage: "musicAlbum2",
            musicTitle: "Thick and Thin",
            singerName: "LANY"),
        MusicModel(
            albumImage: "musicAlbum3",
            musicTitle: "시공간",
            singerName: "기리보이"),
        MusicModel(
            albumImage: "musicAlbum4",
            musicTitle: "NISEKOI",
            singerName: "Futuristic Swaver"),]
    
    
    // MARK: - LifeCycles
    
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
    
    // MARK: - Main Thread
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}

// MARK: - Extensions

extension AppleMusicNodeController {
    
    // MARK: - Layout Helpers
    
    private func layoutSpecThatFits(_ constrainedSize: ASSizeRange) -> ASLayoutSpec {
        return ASInsetLayoutSpec(
            insets: UIEdgeInsets(
                                    top: 34,
                                    left: 9,
                                    bottom: 0,
                                    right: 9),
            child: self.musicCollectionNode)
    }
}

// MARK: - CollectionNode DataSource

extension AppleMusicNodeController: ASCollectionDataSource {
    
    func collectionNode(_ collectionNode: ASCollectionNode, numberOfItemsInSection section: Int) -> Int {
        return self.musicModel.count
    }
    
    func collectionNode(_ collectionNode: ASCollectionNode, nodeBlockForItemAt indexPath: IndexPath) -> ASCellNodeBlock {
        return {
            let musicCell = AppleMusicCellNode(model: self.musicModel[indexPath.item])
            return musicCell
        }
    }
    
}

// MARK: - CollectionNode Delegate

extension AppleMusicNodeController: ASCollectionDelegate {
    func collectionNode(_ collectionNode: ASCollectionNode, constrainedSizeForItemAt indexPath: IndexPath) -> ASSizeRange {
        
        let minWidth = UIScreen.main.bounds.width / 2 - 21
        let maxWidth = UIScreen.main.bounds.width / 2 - 12
        
        return ASSizeRange(
            min: CGSize(width: minWidth, height: minWidth + 34),
            max: CGSize(width: maxWidth, height: maxWidth + 34))
    }
}

// MARK: - UICollectionView DelegateFlowLayout

extension AppleMusicNodeController: UICollectionViewDelegateFlowLayout {
   
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 15
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 16
    }
}
