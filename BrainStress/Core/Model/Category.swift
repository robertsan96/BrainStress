//
//  Category.swift
//  BrainStress
//
//  Created by Robert Sandru on 06/10/2020.
//

import Foundation

class Category: Hashable, CardPresentable {
    
    var name: String
    var imageName: String?
    var overlayColor: String?
    var textColor: String?

    init(withName name: String,
         withImageName imageName: String? = nil,
         withOverlayColor overlayColor: String? = nil,
         withTextColor textColor: String? = nil) {
        self.name = name
        self.imageName = imageName
        self.overlayColor = overlayColor
        self.textColor = textColor ?? "CardTextColor"
    }
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(name)
        hasher.combine(imageName)
    }
    
    static func == (lhs: Category, rhs: Category) -> Bool {
        lhs.name == rhs.name
    }
}
