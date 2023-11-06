//
//  PawnTests.swift
//  ChessAppTests
//
//  Created by 김도형 on 2023/10/24.
//

import XCTest
@testable import ChessApp

final class PawnTests: XCTestCase {
    private let pieceManager = EmptyPiecesManager()
    
    override func setUp() {
        self.pieceManager.resetPieces()
    }
    
    func test_showPositionsCanMove메서드_성공케이스_블랙폰() {
        let blackPawn = Pawn(color: .black, source: Position(file: .A, rank: .one))
        let destination = Position(file: .A, rank: .two)
        
        let positions = blackPawn.strategy.showPositionsCanMove(with: self.pieceManager)
        XCTAssertTrue(positions.contains(where: { position in position == destination }))
    }
    
    func test_showPositionsCanMove메서드_실패케이스_블랙폰_아래로_내려가지_않을_때() {
        let blackPawn = Pawn(color: .black, source: Position(file: .A, rank: .two))
        let destination = Position(file: .A, rank: .one)
        
        let positions = blackPawn.strategy.showPositionsCanMove(with: self.pieceManager)
        XCTAssertFalse(positions.contains(where: { position in position == destination }))
    }

    func test_showPositionsCanMove메서드_실패케이스_블랙폰_한칸이_아닌_두칸을_가려고_할_때() {
        let blackPawn = Pawn(color: .black, source: Position(file: .A, rank: .one))
        let destination = Position(file: .A, rank: .three)
        
        let positions = blackPawn.strategy.showPositionsCanMove(with: self.pieceManager)
        XCTAssertFalse(positions.contains(where: { position in position == destination }))
    }

    func test_showPositionsCanMove메서드_실패케이스_블랙폰_대각선으로_이동할_때() {
        let blackPawn = Pawn(color: .black, source: Position(file: .A, rank: .one))
        let destination = Position(file: .B, rank: .two)
        
        let positions = blackPawn.strategy.showPositionsCanMove(with: self.pieceManager)
        XCTAssertFalse(positions.contains(where: { position in position == destination }))
    }
    
    func test_showPositionsCanMove메서드_성공케이스_화이트폰() {
        let whitePawn = Pawn(color: .white, source: Position(file: .A, rank: .eight))
        let destination = Position(file: .A, rank: .seven)
        
        let positions = whitePawn.strategy.showPositionsCanMove(with: self.pieceManager)
        XCTAssertTrue(positions.contains(where: { position in position == destination }))
    }

    func test_showPositionsCanMove메서드_실패케이스_화이트폰_위로_올라가지_않을_때() {
        let whitePawn = Pawn(color: .white, source: Position(file: .A, rank: .seven))
        let destination = Position(file: .A, rank: .eight)
        
        let positions = whitePawn.strategy.showPositionsCanMove(with: self.pieceManager)
        XCTAssertFalse(positions.contains(where: { position in position == destination }))
    }

    func test_canMove메서드_실패케이스_화이트폰_한칸이_아닌_두칸을_가려고_할_때() {
        let whitePawn = Pawn(color: .white, source: Position(file: .A, rank: .eight))
        let destination = Position(file: .B, rank: .six)
        
        let positions = whitePawn.strategy.showPositionsCanMove(with: self.pieceManager)
        XCTAssertFalse(positions.contains(where: { position in position == destination }))
    }

    func test_canMove메서드_실패케이스_화이트폰_대각선으로_이동할_때() {
        let whitePawn = Pawn(color: .white, source: Position(file: .A, rank: .eight))
        let destination = Position(file: .B, rank: .seven)
        
        let positions = whitePawn.strategy.showPositionsCanMove(with: self.pieceManager)
        XCTAssertFalse(positions.contains(where: { position in position == destination }))
    }
}
