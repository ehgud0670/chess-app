//
//  Bishop.swift
//  ChessApp
//
//  Created by 김도형 on 2023/10/26.
//

import Foundation

struct Bishop: Piece {
    let score: Int = 3
    let color: Color
    let source: Position
    
    var text: String {
        switch self.color {
        case .black:
            return "♝"
        case .white:
            return "♗"
        }
    }
    
    var strategy: PieceStrategy {
        return Bishop.Strategy(source: self.source, color: color)
    }
    
    static func postionsCanCreate(of color: Color) -> [Position] {
        switch color {
        case .black:
            return [Position(file: .C, rank: .one), Position(file: .F, rank: .one)]
        case .white:
            return [Position(file: .C, rank: .eight), Position(file: .F, rank: .eight)]
        }
    }
    
}
