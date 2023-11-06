//
//  Board.swift
//  ChessApp
//
//  Created by 김도형 on 2023/10/18.
//

import Foundation

protocol BoardConfigurable {
    init(piecesManager: PiecesManagerable)
    
    func display() -> [[String]]
    func showPositionsCanMove(of piece: Piece) -> [Position]
    func move(from source: Position, to destination: Position) throws
    func getScore(of color: Color) -> Int
}

final class Board: BoardConfigurable {
    private(set) var turnColor: Color = .white
    private let piecesManager: PiecesManagerable
    
    init(piecesManager: PiecesManagerable = PieceManager()) {
        self.piecesManager = piecesManager
        self.piecesManager.resetPieces()
    }
    
    // MARK: - Internal Methods
    func display() -> [[String]] {
        var boards = [[String]](repeating: [String](repeating: "", count: File.allCases.count),
                                count: Rank.allCases.count)
        
        for (rankNumber, board) in boards.enumerated() {
            for (fileNumber, _) in board.enumerated() {
                let file = File.allCases[fileNumber]
                let rank = Rank.allCases[rankNumber]

                let text = self.piecesManager.piece(at: Position(file: file, rank: rank))?.text
                boards[rankNumber][fileNumber] = text ?? "."
            }
        }

        return boards
    }
    
    func showPositionsCanMove(of piece: Piece) -> [Position] {
        return piece.strategy.showPositionsCanMove(with: self.piecesManager)
    }
    
    func getScore(of color: Color) -> Int {
        return self.piecesManager.pieces(color: color)
            .map({ $0.score })
            .reduce(0, +)
    }
    
    func move(from source: Position, to destination: Position) throws {
        try self.validate(source: source, destination: destination)
        
        self.piecesManager.update(from: source, to: destination)
        self.turnColor = (self.turnColor == .black) ? .white : .black
    }
    
    // MARK: - Private Methods
    private func validate(source: Position, destination: Position) throws {
        guard let originPiece = self.piecesManager.piece(at: source) else {
            throw ValidationError.sourceNotExist
        }
        
        guard originPiece.color == self.turnColor else {
            throw ValidationError.invalidTurn
        }
        
        guard self.canMove(of: originPiece, to: destination) else {
            throw ValidationError.invalidScope
        }
    }
    
    private func canMove(of piece: Piece, to destination: Position) -> Bool {
        let positions = self.showPositionsCanMove(of: piece)
        return positions.contains(where: { position in position == destination })
    }
}
