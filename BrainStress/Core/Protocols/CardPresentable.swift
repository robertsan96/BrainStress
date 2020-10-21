//
//  CardPresentable.swift
//  BrainStress
//
//  Created by Robert Sandru on 21/10/2020.
//

import Foundation

protocol CardPresentable {
    
    var name: String { get set }
    var imageName: String? { get set }
    var overlayColor: String? { get set }
}
