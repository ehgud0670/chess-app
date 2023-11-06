//
//  BoardViewController+DataSource.swift
//  ChessApp
//
//  Created by 김도형 on 2023/11/06.
//

import UIKit

extension BoardViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return BoardViewModel.State.numberOfItems
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let boardCell = collectionView.dequeueReusableCell(withReuseIdentifier: BoardCollectionViewCell.reuseIdentifier, for: indexPath) as? BoardCollectionViewCell
        else { return collectionView.dequeueDefaultCell(for: indexPath) }
        
        return boardCell
    }
}

