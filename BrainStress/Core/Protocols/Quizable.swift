//
//  Quizable.swift
//  BrainStress
//
//  Created by Robert Sandru on 27/10/2020.
//

import Foundation

protocol Quizable {
    
    func quizItem<Model: Quizable & CSVParsable>(extraModels: [Model]) -> QuizItem
}
