//
//  Piece.swift
//  ChessApp
//
//  Created by 김도형 on 2023/10/26.
//

import Foundation

protocol Piece {
    var score: Int { get }
    var color: Color { get }
    var source: Position { get }
    var text: String { get }
    var strategy: PieceStrategy { get }
    
    init(color: Color, source: Position)
    
    static func postionsCanCreate(of color: Color) -> [Position]
}
