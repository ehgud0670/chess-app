//
//  BoardTests+.swift
//  ChessAppTests
//
//  Created by 김도형 on 2023/10/24.
//

import XCTest
@testable import ChessApp

extension BoardTests {
    
    func test_move메서드_실패케이스_destination위치에_같은팀의_말이있을_때_테스트() {
        let board = Board(piecesManager: PiecesManagerStub())
        
        do {
            try board.move(from: Position(file: .A, rank: .seven),
                              to: Position(file: .A, rank: .six))
        } catch let error {
            XCTAssertEqual(error as! ValidationError, ValidationError.invalidScope)
        }
    }
    
}

final fileprivate class PiecesManagerStub: PiecesManagerable {
    private(set) var pieces: [ChessApp.Position : ChessApp.Piece] = [:]
    
    func resetPieces() {
        self.pieces = self.makePawns()
    }
    
    private func makePawns() -> [Position: Pawn] {
        let positionOfFirstPawn = Position(file: .A, rank: .seven)
        let firstPawnOfSameTeam = Pawn(color: .white, source: positionOfFirstPawn)
        
        let positionOfSecondPawn = Position(file: .A, rank: .six)
        let secondPawnOfSameTeam = Pawn(color: .white, source: positionOfSecondPawn)

        return [positionOfFirstPawn: firstPawnOfSameTeam,
               positionOfSecondPawn: secondPawnOfSameTeam]
    }
    
    func piece(at position: ChessApp.Position) -> ChessApp.Piece? {
        self.pieces[position]
    }
    
    // MARK: 아래는 테스트에 사용되지 않는 메서드들 입니다.
    
    func update(from source: ChessApp.Position, to destination: ChessApp.Position) {
        
    }
    
    func hasPiece(at position: ChessApp.Position) -> Bool {
        return true
    }
    
    func pieces(color: ChessApp.Color) -> [ChessApp.Piece] {
        return []
    }
    
    
}
