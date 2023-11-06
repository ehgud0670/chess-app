//
//  BoardViewModel.swift
//  ChessApp
//
//  Created by 김도형 on 2023/11/06.
//

import Foundation

import RxSwift
import RxRelay

extension BoardViewModel {
    struct State {
        static let numberOfRows = Rank.allCases.count
        static let numberOfColumns = File.allCases.count
        
        static let numberOfItems = Self.numberOfRows * Self.numberOfColumns
    }
    
    struct Action {
        
    }
}

final class BoardViewModel: ViewModel {
    private let board: Board
    
    let state: State
    let action: Action
    
    init(board: Board = Board()) {
        self.board = board
        self.state = State()
        self.action = Action()
    }
    
    
    
}
