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
    
    var category: QuizCategory
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
    
    var id = UUID()
    
    var text: String
    var time: QuizItemTime
    
    var answer: QuizItemAnswer
    var category: QuizCategory
    
    static func == (lhs: QuizItem, rhs: QuizItem) -> Bool {
        lhs.id == rhs.id
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
    
    /// Single choice / multiple choice incorrects to show on screen.
    var incorrects: [String] = []
    
    var mergeShuffle: [String] = []
    
    static func == (lhs: QuizItemAnswer, rhs: QuizItemAnswer) -> Bool {
        lhs.answer == rhs.answer
    }
    
    init(type: QuizItemAnswerType,
         answer: [String],
         incorrects: [String] = []) {
        self.type = type
        self.answer = answer
        self.incorrects = incorrects
        self.mergeShuffle = (answer + incorrects).shuffled()
    }
}

struct QuizItemTime: Hashable {
    
    var time: [Difficulty: Double] = [:]
    
    static func == (lhs: QuizItemTime, rhs: QuizItemTime) -> Bool {
        lhs.time == rhs.time
    }
}
