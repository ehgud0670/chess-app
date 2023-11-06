//
//  Position.swift
//  ChessApp
//
//  Created by 김도형 on 2023/10/18.
//

import Foundation

struct Position: Hashable, Equatable {
    let file: File
    let rank: Rank
    
    func makePosition(distanceOfFile: Int = 0, distanceOfRank: Int = 0) -> Position? {
        guard let fileIndexOfOrigin = File.allCases.firstIndex(of: self.file),
              let rankIndexOfOrigin = Rank.allCases.firstIndex(of: self.rank)
        else { return nil }

        let file = File.allCases[safe: fileIndexOfOrigin + distanceOfFile]
        let rank = Rank.allCases[safe: rankIndexOfOrigin + distanceOfRank]
        
        guard let file, let rank else { return nil }
        return Position(file: file, rank: rank)
    }
}
