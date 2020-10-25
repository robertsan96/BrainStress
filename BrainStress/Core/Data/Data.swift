//
//  Data.swift
//  BrainStress
//
//  Created by Robert Sandru on 07/10/2020.
//

import Foundation
import SwiftCSV

enum QuizCategory: CaseIterable {
    
    case math
    case geography
    case trickyQuestions
    case automotive
    case motto
    
    func category() -> CategoryModel {
        switch self {
        case .math: return CategoryModel(withName: "Math",
                                         withImageName: "CardPictureGreece",
                                         withOverlayColor: "CardOverlayMath")
        case .geography: return CategoryModel(withName: "Geography",
                                              withImageName: "CardPictureSunset",
                                              withOverlayColor: "CardOverlayGeography")
        case .trickyQuestions: return CategoryModel(withName: "Tricky Questions",
                                                    withImageName: "CardPictureGNR",
                                                    withOverlayColor: "CardOverlayTrickyQuestions")
        case .automotive: return CategoryModel(withName: "Automotive",
                                               withImageName: "CardPictureCar",
                                               withOverlayColor: "CardOverlayAutomotive")
        case .motto: return CategoryModel(withName: "Mottos",
                                          withImageName: "CardPictureRobert",
                                          withOverlayColor: "CardOverlayMotto")
        }
    }
}

struct QuizData {
    
    static var quizzes: [Quiz] = [
        QuizData.Math.addition1(),
        QuizData.Math.addition2(),
        QuizData.Math.addition3(),
        QuizData.Math.addition4(),
        
        QuizData.Math.divisions1(),
        QuizData.Math.divisions2(),
        QuizData.Math.divisions3(),
        QuizData.Math.divisions4(),
        
        QuizData.Math.subtraction1(),
        QuizData.Math.subtraction2(),
        QuizData.Math.subtraction3(),
        QuizData.Math.subtraction4(),
        
        QuizData.Math.multiplications1(),
        QuizData.Math.multiplications2(),
        QuizData.Math.multiplications3(),
        QuizData.Math.multiplications4(),
        
        QuizData.Geography.capitals1(),
        QuizData.Geography.geography1()
    ]
    
    struct Math {
        
        static func dummyLevel() -> Quiz {
            return Quiz(id: "QM_DUMMY_1",
                        title: "Additions",
                        description: "Some basic maths for first graders.",
                        items: QuizItemData.MathItems.generate(mathItems: 20,
                                                               difficulty: .easy,
                                                               qOperator: .add),
                        category: QuizCategory.math,
                        difficulty: .easy)
        }
        
        static func addition1() -> Quiz {
            
            return Quiz(id: "QM_ADDITIONS_1",
                        title: "Additions",
                        description: "Some basic maths for first graders.",
                        items: QuizItemData.MathItems.generate(mathItems: 20,
                                                               difficulty: .easy,
                                                               qOperator: .add),
                        category: QuizCategory.math,
                        difficulty: .easy)
        }
        
        static func addition2() -> Quiz {
            return Quiz(id: "QM_ADDITIONS_2",
                        title: "Additions",
                        description: "A bit more advanced.",
                        items: QuizItemData.MathItems.generate(mathItems: 20,
                                                               difficulty: .normal,
                                                               qOperator: .add),
                        category: QuizCategory.math,
                        difficulty: .normal)
        }
        
        static func addition3() -> Quiz {
            return Quiz(id: "QM_ADDITIONS_3",
                        title: "Additions",
                        description: "Ugh, it gets harder here.",
                        items: QuizItemData.MathItems.generate(mathItems: 20,
                                                               difficulty: .hard,
                                                               qOperator: .add),
                        category: QuizCategory.math,
                        difficulty: .hard)
        }
        
        static func addition4() -> Quiz {
            return Quiz(id: "QM_ADDITIONS_4",
                        title: "Additions",
                        description: "No way you can finalize this.",
                        items: QuizItemData.MathItems.generate(mathItems: 20,
                                                               difficulty: .insane,
                                                               qOperator: .add),
                        category: QuizCategory.math,
                        difficulty: .insane)
        }
        
        static func subtraction1() -> Quiz {
            return Quiz(id: "QM_SUBTRACTIONS_1",
                        title: "Subtractions",
                        description: "The soul grows by subtraction, not addition.",
                        items: QuizItemData.MathItems.generate(mathItems: 20,
                                                               difficulty: .easy,
                                                               qOperator: .substract),
                        category: QuizCategory.math,
                        difficulty: .easy)
        }
        
        static func subtraction2() -> Quiz {
            return Quiz(id: "QM_SUBTRACTIONS_2",
                        title: "Subtractions",
                        description: "Feeling angry? Let's add some more stress.",
                        items: QuizItemData.MathItems.generate(mathItems: 20,
                                                               difficulty: .normal,
                                                               qOperator: .substract),
                        category: QuizCategory.math,
                        difficulty: .normal)
        }
        
        static func subtraction3() -> Quiz {
            return Quiz(id: "QM_SUBTRACTIONS_3",
                        title: "Subtractions",
                        description: "If you have a bad day, play this. Your day will get even worse.",
                        items: QuizItemData.MathItems.generate(mathItems: 20,
                                                               difficulty: .hard,
                                                               qOperator: .substract),
                        category: QuizCategory.math,
                        difficulty: .hard)
        }
        
        static func subtraction4() -> Quiz {
            return Quiz(id: "QM_SUBTRACTIONS_4",
                        title: "Subtractions",
                        description: "This game shouldn't be here... no one can finalize it.",
                        items: QuizItemData.MathItems.generate(mathItems: 20,
                                                               difficulty: .insane,
                                                               qOperator: .substract),
                        category: QuizCategory.math,
                        difficulty: .insane)
        }
        
        static func multiplications1() -> Quiz {
            return Quiz(id: "QM_MULTIPLICATIONS_1",
                        title: "Multiplications",
                        description: "Some basic maths for first graders.",
                        items: QuizItemData.MathItems.generate(mathItems: 20,
                                                               difficulty: .easy,
                                                               qOperator: .multiply),
                        category: QuizCategory.math,
                        difficulty: .easy)
        }
        
        static func multiplications2() -> Quiz {
            return Quiz(id: "QM_MULTIPLICATIONS_2",
                        title: "Multiplications",
                        description: "Really?",
                        items: QuizItemData.MathItems.generate(mathItems: 20,
                                                               difficulty: .normal,
                                                               qOperator: .multiply),
                        category: QuizCategory.math,
                        difficulty: .normal)
        }
        
        static func multiplications3() -> Quiz {
            return Quiz(id: "QM_MULTIPLICATIONS_3",
                        title: "Multiplications",
                        description: "We promise you have no chance.",
                        items: QuizItemData.MathItems.generate(mathItems: 20,
                                                               difficulty: .hard,
                                                               qOperator: .multiply),
                        category: QuizCategory.math,
                        difficulty: .hard)
        }
        
        static func multiplications4() -> Quiz {
            return Quiz(id: "QM_MULTIPLICATIONS_4",
                        title: "Multiplications",
                        description: "Feeling useless? Think about this game.",
                        items: QuizItemData.MathItems.generate(mathItems: 20,
                                                               difficulty: .insane,
                                                               qOperator: .multiply),
                        category: QuizCategory.math,
                        difficulty: .insane)
        }
        
        static func divisions1() -> Quiz {
            return Quiz(id: "QM_DIVISIONS_1",
                        title: "Divisions",
                        description: "Easy-peasy.",
                        items: QuizItemData.MathItems.generate(mathItems: 20,
                                                               difficulty: .easy,
                                                               qOperator: .division),
                        category: QuizCategory.math,
                        difficulty: .easy)
        }
        
        static func divisions2() -> Quiz {
            return Quiz(id: "QM_DIVISIONS_2",
                        title: "Divisions",
                        description: "Gets harder..",
                        items: QuizItemData.MathItems.generate(mathItems: 20,
                                                               difficulty: .normal,
                                                               qOperator: .division),
                        category: QuizCategory.math,
                        difficulty: .normal)
        }
        
        static func divisions3() -> Quiz {
            return Quiz(id: "QM_DIVISIONS_3",
                        title: "Divisions",
                        description: "Hahahaha! No chance.",
                        items: QuizItemData.MathItems.generate(mathItems: 20,
                                                               difficulty: .hard,
                                                               qOperator: .division),
                        category: QuizCategory.math,
                        difficulty: .hard)
        }
        
        static func divisions4() -> Quiz {
            return Quiz(id: "QM_DIVISIONS_4",
                        title: "Divisions",
                        description: "Ain't nobody got time for that.",
                        items: QuizItemData.MathItems.generate(mathItems: 20,
                                                               difficulty: .insane,
                                                               qOperator: .division),
                        category: QuizCategory.math,
                        difficulty: .insane)
        }
    }
    
    struct Geography {
        
        static func capitals1() -> Quiz {
            
            return Quiz(id: "QM_CAPITALS_1",
                        title: "Capitals",
                        description: "Let's find out how much geography you know!",
                        items: QuizItemData.GeneralQuestions.generate(items: 4),
                        category: QuizCategory.geography,
                        difficulty: .normal)
        }
        
        static func geography1() -> Quiz {
            
            return Quiz(id: "QM_GEOGRAPHY_1",
                        title: "Mix",
                        description: "Rivers, mountains, volcanos ...",
                        items: QuizItemData.GeneralQuestions.generateGeneral(items: 20),
                        category: QuizCategory.geography,
                        difficulty: .normal)
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
                                        category: QuizCategory.math)
                
                generatedQuizItems.append(quizItem)
            }
            return generatedQuizItems
        }
    }
    
    struct GeneralQuestions {
        
        static func generateGeneral(items: Int) -> [QuizItem] {
            var generatedQuizItems: [QuizItem] = []
            var parsedGeneralQuestions = CSVManager.parseGeneralQuestions(csv: .geography1)
            for _ in 0..<items {
                guard let r1 = parsedGeneralQuestions.randomElement() else {
                    return generatedQuizItems
                }
                parsedGeneralQuestions.removeAll { gq -> Bool in
                    gq.question == r1.question
                }
                let qA = r1.answer
                let qT = r1.question
                let answerType: QuizItemAnswerType = r1.incorrects.count > 0 ?
                    .singleChoice :
                    .text
                
                let quizTime = QuizItemTime(time: [.normal: 15])
                let quizAnsw: QuizItemAnswer
                
                if answerType == .text {
                    quizAnsw = QuizItemAnswer(type: answerType, answer: [qA])
                } else if answerType == .singleChoice {
                    quizAnsw = QuizItemAnswer(type: answerType,
                                              answer: [qA],
                                              incorrects: r1.incorrects)
                } else {
                    quizAnsw = QuizItemAnswer(type: answerType, answer: [qA])
                }
                
                let quizItem = QuizItem(text: qT,
                                        time: quizTime,
                                        answer: quizAnsw,
                                        category: QuizCategory.geography)
                
                generatedQuizItems.append(quizItem)
            }
            return generatedQuizItems
        }
        
        
        static func generate(items: Int) -> [QuizItem] {
            var generatedQuizItems: [QuizItem] = []
            let parsedCountries = CSVManager.parseCountryCapitalsCSV()
            for _ in 0..<items {
                let r1 = parsedCountries.randomElement()!
                let qA = r1.capital
                let qT = "Capital of \(r1.name)"
                let answerType: QuizItemAnswerType = .singleChoice
                
                let quizTime = QuizItemTime(time: [.normal: 15])
                let quizAnsw: QuizItemAnswer
                
                let possibleIncorrects = parsedCountries
                    .filter { country -> Bool in
                        country.name != r1.name
                    }
                    .shuffled()
                    .prefix(Int.random(in: 1...3))
                    .map({ c in
                        c.capital
                    })
                quizAnsw = QuizItemAnswer(type: answerType,
                                          answer: [qA],
                                          incorrects: possibleIncorrects)
                
                let quizItem = QuizItem(text: qT,
                                        time: quizTime,
                                        answer: quizAnsw,
                                        category: QuizCategory.geography)
                
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
