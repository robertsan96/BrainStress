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
                        title: "Additions",
                        description: "A bit more advanced.",
                        items: QuizItemData.MathItems.generate(mathItems: 20,
                                                               difficulty: .normal,
                                                               qOperator: .add),
                        category: QuizCategoryData.math,
                        difficulty: .normal)
        }
        
        static func addition3() -> Quiz {
            return Quiz(id: "QM_ADDITIONS_3",
                        title: "Additions",
                        description: "Ugh, it gets harder here.",
                        items: QuizItemData.MathItems.generate(mathItems: 20,
                                                               difficulty: .hard,
                                                               qOperator: .add),
                        category: QuizCategoryData.math,
                        difficulty: .hard)
        }
        
        static func addition4() -> Quiz {
            return Quiz(id: "QM_ADDITIONS_4",
                        title: "Additions",
                        description: "No way you can finalize this.",
                        items: QuizItemData.MathItems.generate(mathItems: 20,
                                                               difficulty: .insane,
                                                               qOperator: .add),
                        category: QuizCategoryData.math,
                        difficulty: .insane)
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
                        title: "Subtractions",
                        description: "Feeling angry? Let's add some more stress.",
                        items: QuizItemData.MathItems.generate(mathItems: 20,
                                                               difficulty: .normal,
                                                               qOperator: .substract),
                        category: QuizCategoryData.math,
                        difficulty: .normal)
        }
        
        static func subtraction3() -> Quiz {
            return Quiz(id: "QM_SUBTRACTIONS_3",
                        title: "Subtractions",
                        description: "If you have a bad day, play this. Your day will get even worse.",
                        items: QuizItemData.MathItems.generate(mathItems: 20,
                                                               difficulty: .hard,
                                                               qOperator: .substract),
                        category: QuizCategoryData.math,
                        difficulty: .hard)
        }
        
        static func subtraction4() -> Quiz {
            return Quiz(id: "QM_SUBTRACTIONS_4",
                        title: "Subtractions",
                        description: "This game shouldn't be here... no one can finalize it.",
                        items: QuizItemData.MathItems.generate(mathItems: 20,
                                                               difficulty: .insane,
                                                               qOperator: .substract),
                        category: QuizCategoryData.math,
                        difficulty: .insane)
        }
        
        static func multiplications1() -> Quiz {
            return Quiz(id: "QM_MULTIPLICATIONS_1",
                        title: "Multiplications",
                        description: "Some basic maths for first graders.",
                        items: QuizItemData.MathItems.generate(mathItems: 20,
                                                               difficulty: .easy,
                                                               qOperator: .multiply),
                        category: QuizCategoryData.math,
                        difficulty: .easy)
        }
        
        static func multiplications2() -> Quiz {
            return Quiz(id: "QM_MULTIPLICATIONS_2",
                        title: "Multiplications",
                        description: "Really?",
                        items: QuizItemData.MathItems.generate(mathItems: 20,
                                                               difficulty: .normal,
                                                               qOperator: .multiply),
                        category: QuizCategoryData.math,
                        difficulty: .normal)
        }
        
        static func multiplications3() -> Quiz {
            return Quiz(id: "QM_MULTIPLICATIONS_3",
                        title: "Multiplications",
                        description: "We promise you have no chance.",
                        items: QuizItemData.MathItems.generate(mathItems: 20,
                                                               difficulty: .hard,
                                                               qOperator: .multiply),
                        category: QuizCategoryData.math,
                        difficulty: .hard)
        }
        
        static func multiplications4() -> Quiz {
            return Quiz(id: "QM_MULTIPLICATIONS_4",
                        title: "Multiplications",
                        description: "Feeling useless? Think about this game.",
                        items: QuizItemData.MathItems.generate(mathItems: 20,
                                                               difficulty: .insane,
                                                               qOperator: .multiply),
                        category: QuizCategoryData.math,
                        difficulty: .insane)
        }
        
        static func divisions1() -> Quiz {
            return Quiz(id: "QM_DIVISIONS_1",
                        title: "Divisions",
                        description: "Easy-peasy.",
                        items: QuizItemData.MathItems.generate(mathItems: 20,
                                                               difficulty: .easy,
                                                               qOperator: .division),
                        category: QuizCategoryData.math,
                        difficulty: .easy)
        }
        
        static func divisions2() -> Quiz {
            return Quiz(id: "QM_DIVISIONS_2",
                        title: "Divisions",
                        description: "Gets harder..",
                        items: QuizItemData.MathItems.generate(mathItems: 20,
                                                               difficulty: .normal,
                                                               qOperator: .division),
                        category: QuizCategoryData.math,
                        difficulty: .normal)
        }
        
        static func divisions3() -> Quiz {
            return Quiz(id: "QM_DIVISIONS_3",
                        title: "Divisions",
                        description: "Hahahaha! No chance.",
                        items: QuizItemData.MathItems.generate(mathItems: 20,
                                                               difficulty: .hard,
                                                               qOperator: .division),
                        category: QuizCategoryData.math,
                        difficulty: .hard)
        }
        
        static func divisions4() -> Quiz {
            return Quiz(id: "QM_DIVISIONS_4",
                        title: "Divisions",
                        description: "Ain't nobody got time for that.",
                        items: QuizItemData.MathItems.generate(mathItems: 20,
                                                               difficulty: .insane,
                                                               qOperator: .division),
                        category: QuizCategoryData.math,
                        difficulty: .insane)
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
