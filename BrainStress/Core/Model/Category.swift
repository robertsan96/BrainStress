//
//  Category.swift
//  BrainStress
//
//  Created by Robert Sandru on 06/10/2020.
//

import Foundation

class Category: Identifiable,
                Hashable,
                Equatable,
                ExpressibleByStringLiteral {
    typealias StringLiteralType = String
    
    var name: String
    
    required init(stringLiteral name: String) {
        self.name = name
    }

    static func == (lhs: Category, rhs: Category) -> Bool {
        lhs.name == rhs.name
    }
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(name)
    }
}
