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
                ExpressibleByStringLiteral,
                CardPresentable {
    
    typealias StringLiteralType = String
    
    var name: String
    var imageName: String?
    var overlayColor: String?
    
    required init(stringLiteral name: String) {
        self.name = name
    }

    init(stringLiteral name: String, imageName: String?, overlayColor: String?) {
        self.name = name
        self.imageName = imageName
        self.overlayColor = overlayColor
    }
    
    static func == (lhs: Category, rhs: Category) -> Bool {
        lhs.name == rhs.name
    }
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(name)
    }
}
