//
//  BoardLayoutGuide.swift
//  ChessApp
//
//  Created by 김도형 on 2023/11/06.
//

import UIKit

struct BoardLayoutGuide {
    
    static var collectionViewFlowLayout: UICollectionViewFlowLayout {
        let flowLayout = UICollectionViewFlowLayout()
        flowLayout.itemSize = self.collectionViewItemSize
        flowLayout.minimumInteritemSpacing = 0
        flowLayout.minimumLineSpacing = 0
        flowLayout.scrollDirection = .vertical
        return flowLayout
    }
    
    private static var cellDiameter: CGFloat {
        return DeviceInfo.screenWidth / CGFloat(BoardViewModel.State.numberOfColumns)
    }
    
    static var collectionViewItemSize: CGSize {
        return CGSize(width: Self.cellDiameter, height: Self.cellDiameter)
    }
}
