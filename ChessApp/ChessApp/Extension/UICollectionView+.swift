//
//  UICollectionViewCell+.swift
//  ChessApp
//
//  Created by 김도형 on 2023/11/06.
//

import UIKit

extension UICollectionView {
    
    func registerDefaultCell() {
        self.register(UICollectionViewCell.self, forCellWithReuseIdentifier: "\(UICollectionViewCell.self)")
    }
    
    func dequeueDefaultCell(for indexPath: IndexPath) -> UICollectionViewCell {
        return self.dequeueReusableCell(withReuseIdentifier: "\(UICollectionViewCell.self)", for: indexPath)
    }
    
}
