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
    
    struct Math {
        
        static func dummyLevel() -> Quiz {
            return Quiz(id: "QM_DUMMY_1",
                        title: "Additions",
                        description: "Some basic maths for first graders.",
                        items: QuizItemData.MathItems.generate(mathItems: 20,
                                                               difficulty: .easy,
                                                               qOperator: .add),
                        category: QuizCategoryData.math,
                        difficulty: .easy)
        }
        
        static func addition1() -> Quiz {
            return Quiz(id: "QM_ADDITIONS_1",
                        title: "Additions",
                        description: "Some basic maths for first graders.",
                        items: QuizItemData.MathItems.generate(mathItems: 20,
                                                               difficulty: .easy,
                                                               qOperator: .add),
                        category: QuizCategoryData.math,
                        difficulty: .easy)
        }
        
        static func addition2() -> Quiz {
            return Quiz(id: "QM_ADDITIONS_2",
                        title: "2 Second Additions",
                        description: "Can you solve easy additions in 2 seconds?",
                        items: QuizItemData.MathItems.generate(mathItems: 20,
                                                               timeConfig: QuizItemTime(time: [.easy: 2]),
                                                               difficulty: .easy,
                                                               qOperator: .add),
                        category: QuizCategoryData.math,
                        difficulty: .easy)
        }
        
        static func subtraction1() -> Quiz {
            return Quiz(id: "QM_SUBTRACTIONS_1",
                        title: "Subtractions",
                        description: "The soul grows by subtraction, not addition.",
                        items: QuizItemData.MathItems.generate(mathItems: 20,
                                                               difficulty: .easy,
                                                               qOperator: .substract),
                        category: QuizCategoryData.math,
                        difficulty: .easy)
        }
        
        static func subtraction2() -> Quiz {
            return Quiz(id: "QM_SUBTRACTIONS_2",
                        title: "2 Second Subtractions",
                        description: "Looks easy? It isn't.",
                        items: QuizItemData.MathItems.generate(mathItems: 20,
                                                               timeConfig: QuizItemTime(time: [.easy: 2]),
                                                               difficulty: .easy,
                                                               qOperator: .substract),
                        category: QuizCategoryData.math,
                        difficulty: .easy)
        }
    }
}

struct QuizItemData {
    
    struct MathItems {
        
        static func generate(mathItems items: Int,
                             timeConfig time: QuizItemTime = QuizItemTime(time: [.easy: 5,
                                                                                 .normal: 8,
                                                                                 .hard: 12,
                                                                                 .insane: 20]),
                             difficulty: Difficulty,
                             qOperator: Operator) -> [QuizItem] {
            var generatedQuizItems: [QuizItem] = []
            for _ in 0..<items {
                
                let r1 = Double(difficulty.mathInterval(forOperator: qOperator).randomElement()!)
                let r2 = Double(difficulty.mathInterval(forOperator: qOperator).randomElement()!)
                let qA = qOperator.compute(left: r1, right: r2).clean
                let qT = "\(r1.clean) \(qOperator.symbol()) \(r2.clean)"
                
                let quizTime = time
                let quizAnsw = QuizItemAnswer(type: .text, answer: [qA])
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

struct QuizMessageData {
    
    struct EndingMessages {
        
        static func winningMessages() -> [String] {
            return [
                "Nailed it!",
                "You'll fail next time!",
                "Don't feel so good about you.",
                "Look at you shining!",
                "OMG, this was good!",
                "You're grounded!",
                "Awesome! 😎",
                "🥳🤩😍",
                "Perfect!"
            ]
        }
        
        static func failingMessages() -> [String] {
            return [
                "Stressy?!",
                "Plz don't uninstall the app, we'll provide easier ones :(. Kidding.",
                "Better luck next time!",
                "Failing is not an option, you say?",
                "Ugh.. bad",
                "Cool story, bro",
                "I hope your day is as pleasant as your personality!",
                "I don't care what everyone else says. I don't think you're that bad."
            ]
        }
    }
}
