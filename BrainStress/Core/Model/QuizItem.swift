//
//  Question.swift
//  BrainStress
//
//  Created by Robert Sandru on 07/10/2020.
//

import Foundation

struct Quiz: Hashable {
    
    
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
    
    static func == (lhs: Quiz, rhs: Quiz) -> Bool {
        lhs.id == rhs.id
    }
}

struct QuizItem: Hashable {
    
    var text: String
    var time: QuizItemTime
    
    var answer: QuizItemAnswer
    var category: Category
    
    static func == (lhs: QuizItem, rhs: QuizItem) -> Bool {
        lhs.text == rhs.text
    }
}

enum QuizItemAnswerType {
    
    case text
    case numeric
    case multipleChoice
    case singleChoice
}

struct QuizItemAnswer: Hashable {
    
    var type: QuizItemAnswerType
    
    var answer: [String]
    
    static func == (lhs: QuizItemAnswer, rhs: QuizItemAnswer) -> Bool {
        lhs.answer == rhs.answer
    }
}

struct QuizItemTime: Hashable {
    
    var time: [Difficulty: Double] = [:]
    
    static func == (lhs: QuizItemTime, rhs: QuizItemTime) -> Bool {
        lhs.time == rhs.time
    }
}
