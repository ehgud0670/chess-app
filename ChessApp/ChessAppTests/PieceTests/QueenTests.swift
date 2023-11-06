//
//  QueenTests.swift
//  ChessAppTests
//
//  Created by 김도형 on 2023/10/26.
//

import XCTest
@testable import ChessApp

final class QueenTests: XCTestCase {
    private var sut: Queen!
    private let pieceManager = EmptyPiecesManager()
    
    override func setUpWithError() throws {
        self.sut = Queen(color: .white, source: Position(file: .D, rank: .five))
        self.pieceManager.resetPieces()
    }
    
    func test_showPositionsCanMove메서드_성공케이스_up() {
        let destination = Position(file: .D, rank: .eight)
        
        let positions = self.sut.strategy.showPositionsCanMove(with: self.pieceManager)
        XCTAssertTrue(positions.contains(where: { position in position == destination }))
    }
    
    func test_showPositionsCanMove메서드_성공케이스_down() {
        let destination = Position(file: .D, rank: .one)
        
        let positions = self.sut.strategy.showPositionsCanMove(with: self.pieceManager)
        XCTAssertTrue(positions.contains(where: { position in position == destination }))
    }
    
    func test_showPositionsCanMove메서드_성공케이스_left() {
        let destination = Position(file: .A, rank: .five)
        
        let positions = self.sut.strategy.showPositionsCanMove(with: self.pieceManager)
        XCTAssertTrue(positions.contains(where: { position in position == destination }))
    }
    
    func test_showPositionsCanMove메서드_성공케이스_right() {
        let destination = Position(file: .F, rank: .five)
        
        let positions = self.sut.strategy.showPositionsCanMove(with: self.pieceManager)
        XCTAssertTrue(positions.contains(where: { position in position == destination }))
    }
    
    func test_showPositionsCanMove메서드_성공케이스_upAndLeft() {
        let destination = Position(file: .B, rank: .seven)
        
        let positions = self.sut.strategy.showPositionsCanMove(with: self.pieceManager)
        XCTAssertTrue(positions.contains(where: { position in position == destination }))
    }
    
    func test_showPositionsCanMove메서드_성공케이스_upAndRight() {
        let destination = Position(file: .F, rank: .seven)
        
        let positions = self.sut.strategy.showPositionsCanMove(with: self.pieceManager)
        XCTAssertTrue(positions.contains(where: { position in position == destination }))
    }
    
    func test_showPositionsCanMove메서드_성공케이스_downAndLeft() {
        let destination = Position(file: .A, rank: .two)
        
        let positions = self.sut.strategy.showPositionsCanMove(with: self.pieceManager)
        XCTAssertTrue(positions.contains(where: { position in position == destination }))
    }
    
    func test_showPositionsCanMove메서드_성공케이스_downAndRight() {
        let destination = Position(file: .G, rank: .two)
        
        let positions = self.sut.strategy.showPositionsCanMove(with: self.pieceManager)
        XCTAssertTrue(positions.contains(where: { position in position == destination }))
    }
    
    func test_showPositionsCanMove메서드_실패케이스_지금현재위치로_이동할_때() {
        let destination = Position(file: .D, rank: .five)
        
        let positions = self.sut.strategy.showPositionsCanMove(with: self.pieceManager)
        XCTAssertFalse(positions.contains(where: { position in position == destination }))
    }
}
