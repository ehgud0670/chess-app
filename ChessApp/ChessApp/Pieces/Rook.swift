//
//  Rook.swift
//  ChessApp
//
//  Created by 김도형 on 2023/10/26.
//

import Foundation

struct Rook: Piece {
    let score: Int = 5
    let color: Color
    let source: Position
    
    var text: String {
        switch self.color {
        case .black:
            return "♜"
        case .white:
            return "♖"
        }
    }
    
    var strategy: PieceStrategy {
        return Rook.Strategy(source: self.source, color: self.color)
    }
    
    static func postionsCanCreate(of color: Color) -> [Position] {
        switch color {
        case .black:
            return [Position(file: .A, rank: .one), Position(file: .H, rank: .one)]
        case .white:
            return [Position(file: .A, rank: .eight), Position(file: .H, rank: .eight)]
        }
    }
}
