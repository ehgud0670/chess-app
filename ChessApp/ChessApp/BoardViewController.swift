//
//  ViewController.swift
//  ChessApp
//
//  Created by 김도형 on 16/10/2023.
//

import UIKit

import RxSwift
import RxCocoa

final class BoardViewController: UIViewController {

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
    }
    
    private func setupLayout() {
        
    }

}

