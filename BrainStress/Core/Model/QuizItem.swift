//
//  Question.swift
//  BrainStress
//
//  Created by Robert Sandru on 07/10/2020.
//

import Foundation

struct Quiz {
    
    var id: String
    var title: String
    var description: String = ""
    var items: [QuizItem]
    
    var category: Category
    var difficulty: Difficulty
    
    func getTime() -> Double {
        guard let firstItem = items.first else { return 0 }
        guard let time = firstItem.time.time[difficulty] else { return 0 }
        return time
    }
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
