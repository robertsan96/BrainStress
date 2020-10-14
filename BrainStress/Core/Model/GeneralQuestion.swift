//
//  GeneralQuestion.swift
//  BrainStress
//
//  Created by Robert Sandru on 14/10/2020.
//

import Foundation

struct GeneralQuestion: Hashable {
    
    var question: String
    var answer: String
    var incorrects: [String] = []
    
    static func == (lhs: GeneralQuestion, rhs: GeneralQuestion) -> Bool {
        lhs.question == rhs.question
    }
}
