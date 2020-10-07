//
//  Data.swift
//  BrainStress
//
//  Created by Robert Sandru on 07/10/2020.
//

import Foundation

struct QuizCategoryData {
    static let math = Category(name: "Math")
}

struct QuizData {
    
}

struct QuizItemData {
    
    struct MathItems {
        
        static func generate(mathItems items: Int, difficulty: Difficulty, qOperator: Operator) -> [QuizItem] {
            var generatedQuizItems: [QuizItem] = []
            for _ in 0..<items {
                
                let r1 = Double(difficulty.mathInterval().randomElement()!)
                let r2 = Double(difficulty.mathInterval().randomElement()!)
                let qA = String(qOperator.compute(left: r1, right: r2))
                let qT = "\(r1) \(qOperator.symbol()) \(r2)"
                
                let quizTime = QuizItemTime(time: [.easy: 5,
                                                   .normal: 8,
                                                   .hard: 12])
                let quizAnsw = QuizItemAnswer(type: .numeric, answer: [qA])
                let quizItem = QuizItem(text: qT,
                                        time: quizTime,
                                        answer: quizAnsw,
                                        category: QuizCategoryData.math)
                
                generatedQuizItems.append(quizItem)
            }
            return generatedQuizItems
        }
    }
}
