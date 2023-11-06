//
//  ViewController.swift
//  ChessApp
//
//  Created by 김도형 on 16/10/2023.
//

import UIKit

import RxSwift
import RxCocoa
import SnapKit

final class BoardViewController: UIViewController {
    private let collectionView = UICollectionView(frame: .zero, collectionViewLayout: BoardLayoutGuide.collectionViewFlowLayout)
    let viewModel: BoardViewModel
    
    init(viewModel: BoardViewModel = BoardViewModel()) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.setupViews()
    }

    private func setupViews() {
        self.setupAttributes()
        self.setupLayout()
    }
    
    private func setupAttributes() {
        self.view.backgroundColor = .beige
        
        self.collectionView.dataSource = self
        self.collectionView.backgroundColor = .clear
        
        self.collectionView.registerDefaultCell()
        self.collectionView.register(BoardCollectionViewCell.self, forCellWithReuseIdentifier: BoardCollectionViewCell.reuseIdentifier)
    }
    
    private func setupLayout() {
        self.view.addSubview(self.collectionView)
        
        self.collectionView.snp.makeConstraints({ make in
            make.leading.trailing.equalToSuperview()
            make.center.equalToSuperview()
            make.height.equalTo(self.collectionView.snp.width)
        })
    }

}
