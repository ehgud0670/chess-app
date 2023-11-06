//
//  KnightTests.swift
//  ChessAppTests
//
//  Created by 김도형 on 2023/10/26.
//

import XCTest
@testable import ChessApp

final class KnightTests: XCTestCase {
    private var sut: Knight!
    private let pieceManager = EmptyPiecesManager()

    override func setUpWithError() throws {
        self.sut = Knight(color: .white, source: Position(file: .D, rank: .four))
        self.pieceManager.resetPieces()
    }
    
    func test_showPositionsCanMove메서드_성공케이스_upAndLeft() {
        let destination = Position(file: .C, rank: .six)
        let positions = self.sut.strategy.showPositionsCanMove(with: self.pieceManager)
        XCTAssertTrue(positions.contains(where: { position in position == destination }))
    }

    func test_showPositionsCanMove메서드_성공케이스_upAndRight() {
        let destination = Position(file: .E, rank: .six)
        let positions = self.sut.strategy.showPositionsCanMove(with: self.pieceManager)
        XCTAssertTrue(positions.contains(where: { position in position == destination }))
    }
    
    func test_showPositionsCanMove메서드_성공케이스_lefAndUp() {
        let destination = Position(file: .B, rank: .five)
        let positions = self.sut.strategy.showPositionsCanMove(with: self.pieceManager)
        XCTAssertTrue(positions.contains(where: { position in position == destination }))
    }
    
    func test_showPositionsCanMove메서드_성공케이스_leftAndDown() {
        let destination = Position(file: .B, rank: .three)
        let positions = self.sut.strategy.showPositionsCanMove(with: self.pieceManager)
        XCTAssertTrue(positions.contains(where: { position in position == destination }))
    }
    
    func test_showPositionsCanMove메서드_성공케이스_downAndLeft() {
        let destination = Position(file: .C, rank: .two)
        let positions = self.sut.strategy.showPositionsCanMove(with: self.pieceManager)
        XCTAssertTrue(positions.contains(where: { position in position == destination }))
    }
    
    func test_showPositionsCanMove메서드_성공케이스_downAndRight() {
        let destination = Position(file: .E, rank: .two)
        let positions = self.sut.strategy.showPositionsCanMove(with: self.pieceManager)
        XCTAssertTrue(positions.contains(where: { position in position == destination }))
    }
    
    func test_showPositionsCanMove메서드_성공케이스_rightAndUp() {
        let destination = Position(file: .F, rank: .five)
        let positions = self.sut.strategy.showPositionsCanMove(with: self.pieceManager)
        XCTAssertTrue(positions.contains(where: { position in position == destination }))
    }
    
    func test_showPositionsCanMove메서드_성공케이스_rightAndDown() {
        let destination = Position(file: .F, rank: .three)
        let positions = self.sut.strategy.showPositionsCanMove(with: self.pieceManager)
        XCTAssertTrue(positions.contains(where: { position in position == destination }))
    }
    
    func test_showPositionsCanMove메서드_실패케이스_D_5() {
        let destination = Position(file: .D, rank: .five)
        let positions = self.sut.strategy.showPositionsCanMove(with: self.pieceManager)
        XCTAssertFalse(positions.contains(where: { position in position == destination }))
    }
}
