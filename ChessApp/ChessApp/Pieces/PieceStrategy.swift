//
//  PieceStrategy.swift
//  ChessApp
//
//  Created by 김도형 on 2023/11/02.
//

import Foundation

protocol PieceStrategy {
    var source: Position { get }
    var color: Color { get }
    var directions: [Direction] { get }
    
    func showPositionsCanMove(with piecesManager: PiecesManagerable) -> [Position]
}

enum Direction {
    case up
    case down
    case left
    case right
    case upAndLeft
    case upAndRight
    case downAndLeft
    case downAndRight
    case leftAndUp
    case leftAndDown
    case rightAndUp
    case rightAndDown
}

//MARK: Pawn
extension Pawn {
    
    struct Strategy: PieceStrategy {
        let source: Position
        let color: Color
        
        var directions: [Direction] {
            switch self.color {
            case .black:
                return [.up]
            case .white:
                return [.down]
            }
        }
        
        init(source: Position, color: Color) {
            self.source = source
            self.color = color
        }
        
        func showPositionsCanMove(with piecesManager: PiecesManagerable) -> [Position] {
            let nextPositions = self.directions.compactMap({ direction -> Position? in
                var nextPosition: Position?
                
                switch direction {
                case .up:
                    nextPosition = self.source.makePosition(distanceOfRank: 1)
                case .down:
                    nextPosition = self.source.makePosition(distanceOfRank: -1)
                default:
                    nextPosition = nil
                }
                
                guard let nextPosition else { return nil }
                
                let piece = piecesManager.piece(at: nextPosition)
                if piece == nil { return nextPosition }
                return piece!.color == self.color ? nil : nextPosition
            })
            
            return nextPositions
        }
    }
    
}

//MARK: Bishop
extension Bishop {
    
    struct Strategy: PieceStrategy {
        var source: Position
        let color: Color
        let directions: [Direction] = [.upAndLeft, .upAndRight, .downAndLeft, .downAndRight]
        
        init(source: Position, color: Color) {
            self.source = source
            self.color = color
        }
        
        func showPositionsCanMove(with piecesManager: PiecesManagerable) -> [Position] {
            let nextPositions: [Position] = self.directions.flatMap { direction -> [Position] in
                switch direction {
                case .upAndLeft:
                    return self.getNextPositions(amountOfFile: -1, amountOfRank: 1, with: piecesManager)
                case .upAndRight:
                    return self.getNextPositions(amountOfFile: 1, amountOfRank: 1, with: piecesManager)
                case .downAndLeft:
                    return self.getNextPositions(amountOfFile: -1, amountOfRank: -1, with: piecesManager)
                case .downAndRight:
                    return self.getNextPositions(amountOfFile: 1, amountOfRank: -1, with: piecesManager)
                default:
                    return []
                }
            }
            
            return nextPositions
        }
        
        private func getNextPositions(amountOfFile: Int, amountOfRank: Int, with piecesManager: PiecesManagerable) -> [Position] {
            var positions = [Position]()

            for i in 0 ..< 7 {
                let distanceOfFile = amountOfFile * (i + 1)
                let distanceOfRank = amountOfRank * (i + 1)
                
                guard let nextPosition = self.source.makePosition(distanceOfFile: distanceOfFile,
                                                                  distanceOfRank: distanceOfRank) else {
                    break
                }
                
                let piece = piecesManager.piece(at: nextPosition)
                if piece == nil {
                    positions.append(nextPosition)
                    continue
                }
                
                guard piece!.color == self.color else {
                    break
                }
                
                positions.append(nextPosition)
            }
            
            return positions
        }
        
    }
    
}

//MARK: Knight
extension Knight {
    
    struct Strategy: PieceStrategy {
        let source: Position
        let color: Color
        let directions: [Direction] = [.upAndLeft,
                                       .upAndRight,
                                       .leftAndUp,
                                       .leftAndDown,
                                       .downAndLeft,
                                       .downAndRight,
                                       .rightAndUp,
                                       .rightAndDown]
        
        init(source: Position, color: Color) {
            self.source = source
            self.color = color
        }
        
        func showPositionsCanMove(with piecesManager: PiecesManagerable) -> [Position] {
            let positions = self.directions.compactMap({ direction -> Position? in
                switch direction {
                case .upAndLeft:
                    return self.getNextPosition(firstAmount: (file: 0, rank: 1), secondAmount: (file: -1, rank: 1), with: piecesManager)
                case .upAndRight:
                    return self.getNextPosition(firstAmount: (file: 0, rank: 1), secondAmount: (file: 1, rank: 1), with: piecesManager)
                case .downAndLeft:
                    return self.getNextPosition(firstAmount: (file: 0, rank: -1), secondAmount: (file: -1, rank: -1), with: piecesManager)
                case .downAndRight:
                    return self.getNextPosition(firstAmount: (file: 0, rank: -1), secondAmount: (file: 1, rank: -1), with: piecesManager)
                case .leftAndUp:
                    return self.getNextPosition(firstAmount: (file: -1, rank: 0), secondAmount: (file: -1, rank: 1), with: piecesManager)
                case .leftAndDown:
                    return self.getNextPosition(firstAmount: (file: -1, rank: 0), secondAmount: (file: -1, rank: -1), with: piecesManager)
                case .rightAndUp:
                    return self.getNextPosition(firstAmount: (file: 1, rank: 0), secondAmount: (file: 1, rank: 1), with: piecesManager)
                case .rightAndDown:
                    return self.getNextPosition(firstAmount: (file: 1, rank: 0), secondAmount: (file: 1, rank: -1), with: piecesManager)
                default:
                    return nil
                }
            })
            
            return positions
        }
        
        private func getNextPosition(firstAmount: (file: Int, rank: Int), secondAmount: (file: Int, rank: Int), with piecesManager: PiecesManagerable) -> Position? {
            guard let firstStep = self.source.makePosition(distanceOfFile: firstAmount.file, distanceOfRank: firstAmount.rank),
                  piecesManager.hasPiece(at: firstStep) == false else {
                return nil
            }
            
            guard let destination = firstStep.makePosition(distanceOfFile: secondAmount.file, distanceOfRank: secondAmount.rank) else {
                return nil
            }
            
            let piece = piecesManager.piece(at: destination)
            if piece == nil { return destination }
            return piece!.color == self.color ? nil : destination
        }
    }

}

//MARK: Rook
extension Rook {
    
    struct Strategy: PieceStrategy {
        let source: Position
        let color: Color
        let directions: [Direction] = [.up,
                                       .down,
                                       .left,
                                       .right]
        
        init(source: Position, color: Color) {
            self.source = source
            self.color = color
        }
        
        func showPositionsCanMove(with piecesManager: PiecesManagerable) -> [Position] {
            let nextPositions: [Position] = self.directions.flatMap { direction -> [Position] in
                switch direction {
                case .up:
                    return self.getNextPositions(amountOfFile: 0, amountOfRank: 1, with: piecesManager)
                case .down:
                    return self.getNextPositions(amountOfFile: 0, amountOfRank: -1, with: piecesManager)
                case .left:
                    return self.getNextPositions(amountOfFile: -1, amountOfRank: 0, with: piecesManager)
                case .right:
                    return self.getNextPositions(amountOfFile: 1, amountOfRank: 0, with: piecesManager)
                default:
                    return []
                }
            }
            
            return nextPositions
        }
        
        private func getNextPositions(amountOfFile: Int, amountOfRank: Int, with piecesManager: PiecesManagerable) -> [Position] {
            var positions = [Position]()

            for i in 0 ..< 7 {
                let distanceOfFile = amountOfFile * (i + 1)
                let distanceOfRank = amountOfRank * (i + 1)
                
                guard let nextPosition = self.source.makePosition(distanceOfFile: distanceOfFile,
                                                                  distanceOfRank: distanceOfRank) else {
                    break
                }
                
                let piece = piecesManager.piece(at: nextPosition)
                if piece == nil {
                    positions.append(nextPosition)
                    continue
                }
                
                guard piece!.color == self.color else {
                    break
                }
                
                positions.append(nextPosition)
            }
            
            return positions
        }
        
    }
    
}

extension Queen {
    
    struct Strategy: PieceStrategy {
        let source: Position
        let color: Color
        let directions: [Direction] = [.up,
                                       .down,
                                       .left,
                                       .right,
                                       .upAndLeft,
                                       .upAndRight,
                                       .downAndLeft,
                                       .downAndRight]
        
        init(source: Position, color: Color) {
            self.source = source
            self.color = color
        }
        
        func showPositionsCanMove(with piecesManager: PiecesManagerable) -> [Position] {
            let nextPositions: [Position] = self.directions.flatMap { direction -> [Position] in
                switch direction {
                case .up:
                    return self.getNextPositions(amountOfFile: 0, amountOfRank: 1, with: piecesManager)
                case .down:
                    return self.getNextPositions(amountOfFile: 0, amountOfRank: -1, with: piecesManager)
                case .left:
                    return self.getNextPositions(amountOfFile: -1, amountOfRank: 0, with: piecesManager)
                case .right:
                    return self.getNextPositions(amountOfFile: 1, amountOfRank: 0, with: piecesManager)
                case .upAndLeft:
                    return self.getNextPositions(amountOfFile: -1, amountOfRank: 1, with: piecesManager)
                case .upAndRight:
                    return self.getNextPositions(amountOfFile: 1, amountOfRank: 1, with: piecesManager)
                case .downAndLeft:
                    return self.getNextPositions(amountOfFile: -1, amountOfRank: -1, with: piecesManager)
                case .downAndRight:
                    return self.getNextPositions(amountOfFile: 1, amountOfRank: -1, with: piecesManager)
                default:
                    return []
                }
            }
            
            return nextPositions
        }
        
        private func getNextPositions(amountOfFile: Int, amountOfRank: Int, with piecesManager: PiecesManagerable) -> [Position] {
            var positions = [Position]()

            for i in 0 ..< 7 {
                let distanceOfFile = amountOfFile * (i + 1)
                let distanceOfRank = amountOfRank * (i + 1)
                
                guard let nextPosition = self.source.makePosition(distanceOfFile: distanceOfFile,
                                                                  distanceOfRank: distanceOfRank) else {
                    break
                }
                
                let piece = piecesManager.piece(at: nextPosition)
                if piece == nil {
                    positions.append(nextPosition)
                    continue
                }
                
                guard piece!.color == self.color else {
                    break
                }
                
                positions.append(nextPosition)
            }
            
            return positions
        }
        
        
    }
    
}
