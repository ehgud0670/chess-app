//
//  EmptyPiecesManager.swift
//  ChessAppTests
//
//  Created by 김도형 on 2023/11/02.
//

import Foundation
@testable import ChessApp

final class EmptyPiecesManager: PiecesManagerable {
    private var pieces: [ChessApp.Position : ChessApp.Piece] = [:]
    
    func resetPieces() {
        self.pieces = self.makePawns()
    }
    
    private func makePawns() -> [Position: Pawn] {
        return [:]
    }
    
    func piece(at position: ChessApp.Position) -> ChessApp.Piece? {
        self.pieces[position]
    }
    
    // MARK: 아래는 테스트에 사용되지 않는 메서드들 입니다.
    
    func update(from source: ChessApp.Position, to destination: ChessApp.Position) {
        
    }
    
    func hasPiece(at position: ChessApp.Position) -> Bool {
        return self.pieces[position] != nil
    }
    
    func pieces(color: ChessApp.Color) -> [ChessApp.Piece] {
        return []
    }
}
