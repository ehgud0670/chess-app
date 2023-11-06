//
//  Pawn.swift
//  ChessApp
//
//  Created by 김도형 on 2023/10/18.
//

import Foundation

struct Pawn: Piece {
    let score: Int = 1
    let color: Color
    let source: Position
    
    var text: String {
        switch self.color {
        case .black:
            return "♟"
        case .white:
            return "♙"
        }
    }
    
    var strategy: PieceStrategy {
        return Pawn.Strategy(source: self.source, color: self.color)
    }
    
    private func isSame(file: File) -> Bool {
        return self.source.file == file
    }
        
    static func postionsCanCreate(of color: Color) -> [Position] {
        switch color {
        case .black:
            return File.allCases.map({ Position(file: $0, rank: .two) })
        case .white:
            return File.allCases.map({ Position(file: $0, rank: .seven) })
        }
    }
}


