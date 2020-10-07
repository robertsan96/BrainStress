//
//  Question.swift
//  BrainStress
//
//  Created by Robert Sandru on 07/10/2020.
//

import Foundation

struct Quiz {
    
    var title: String
    var items: [QuizItem]
    
    var category: Category
    var difficulty: Difficulty
}

struct QuizItem {
    
    var text: String
    var time: QuizItemTime
    
    var answer: QuizItemAnswer
    var category: Category
}

enum QuizItemAnswerType {
    
    case text
    case numeric
    case multipleChoice
    case singleChoice
}

struct QuizItemAnswer {
    
    var type: QuizItemAnswerType
    
    var answer: [String]
}

struct QuizItemTime {
    
    var time: [Difficulty: Double] = [:]
}
