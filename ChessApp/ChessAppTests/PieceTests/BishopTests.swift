//
//  BishopTests.swift
//  ChessAppTests
//
//  Created by 김도형 on 2023/10/26.
//

import XCTest
@testable import ChessApp

final class BishopTests: XCTestCase {
    private var sut: Bishop!
    private let pieceManager = EmptyPiecesManager()

    override func setUpWithError() throws {
        self.sut = Bishop(color: .white, source: Position(file: .D, rank: .five))
        self.pieceManager.resetPieces()
    }

    func test_showPositionsCanMove메서드_성공케이스_G_2_로_이동할_때() {
        let destination = Position(file: .G, rank: .two)
        let positions = self.sut.strategy.showPositionsCanMove(with: self.pieceManager)
        XCTAssertTrue(positions.contains(where: { position in position == destination }))
    }
    
    func test_showPositionsCanMove메서드_실패케이스_지금현재위치로_이동할_때() {
        let destination = Position(file: .D, rank: .five)
        let positions = self.sut.strategy.showPositionsCanMove(with: self.pieceManager)
        XCTAssertFalse(positions.contains(where: { position in position == destination }))
    }
    
    func test_showPositionsCanMove메서드_실패케이스_D_2_로_이동할_때() {
        let destination = Position(file: .D, rank: .two)
        let positions = self.sut.strategy.showPositionsCanMove(with: self.pieceManager)
        XCTAssertFalse(positions.contains(where: { position in position == destination }))
    }
}

