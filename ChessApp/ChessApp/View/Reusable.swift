//
//  Reusable.swift
//  ChessApp
//
//  Created by 김도형 on 2023/11/06.
//

import Foundation

protocol Reusable {
    
    static var reuseIdentifier: String { get }
    
}

extension Reusable {
    
    static var reuseIdentifier: String {
        return String(describing: self)
    }
    
}
