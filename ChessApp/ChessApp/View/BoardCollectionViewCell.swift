//
//  BoardCollectionViewCell.swift
//  ChessApp
//
//  Created by 김도형 on 2023/11/06.
//

import UIKit

final class BoardCollectionViewCell: UICollectionViewCell, Reusable {

    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.configureAttribute()
        self.configureLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configureAttribute() {
        self.layer.borderWidth = 1
        self.layer.borderColor = UIColor.black.cgColor
    }
    
    private func configureLayout() {
        
    }
}
