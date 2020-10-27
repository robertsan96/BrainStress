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
    case corporate
    
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
        case .corporate: return CategoryModel(withName: "Corporate",
                                              withImageName: "CardPictureRobert",
                                              withOverlayColor: "CardOverlayMotto")
        }
    }
}

struct QuizData {
    
    var quizzes: [Quiz] = [
        QuizData.Math().addition1(),
        QuizData.Math().addition2(),
        QuizData.Math().addition3(),
        QuizData.Math().addition4(),
        
        QuizData.Math().divisions1(),
        QuizData.Math().divisions2(),
//        QuizData.Math().divisions3(),
//        QuizData.Math().divisions4(),
        
        QuizData.Math().subtraction1(),
        QuizData.Math().subtraction2(),
        QuizData.Math().subtraction3(),
        QuizData.Math().subtraction4(),
        
        QuizData.Math().multiplications1(),
        QuizData.Math().multiplications2(),
//        QuizData.Math().multiplications3(),
//        QuizData.Math().multiplications4(),
        
        QuizData.Geography().capitals1(),
//        QuizData.Geography().geography1(),
        
        QuizData.Companies().mottos1()
    ]
    
    struct Math {
        
        func dummyLevel() -> Quiz {
            return Quiz(id: "QM_DUMMY_1",
                        title: "Additions",
                        description: "This quiz contains easy additions that could improve your " +
                        "basic math skills. You will enjoy easy additions between numbers from 0 to 15.",
                        items: QuizItemData.MathItems.generate(mathItems: 20,
                                                               difficulty: .easy,
                                                               qOperator: .add),
                        category: QuizCategory.math,
                        difficulty: .easy)
        }
        
        func addition1() -> Quiz {
            
            return Quiz(id: "QM_ADDITIONS_1",
                        title: "🟢 Additions",
                        description: "This quiz contains easy additions that could improve your " +
                        "basic math skills. You will enjoy easy additions between numbers from 0 to 15.",
                        items: QuizItemData.MathItems.generate(mathItems: 20,
                                                               difficulty: .easy,
                                                               qOperator: .add),
                        category: QuizCategory.math,
                        difficulty: .easy)
        }
        
        func addition2() -> Quiz {
            return Quiz(id: "QM_ADDITIONS_2",
                        title: "🟡 Additions",
                        description: "This quiz contains additions that could improve your " +
                        "math skills. You will enjoy normal additions between numbers from 0 to 50.",
                        items: QuizItemData.MathItems.generate(mathItems: 20,
                                                               difficulty: .normal,
                                                               qOperator: .add),
                        category: QuizCategory.math,
                        difficulty: .normal)
        }
        
        func addition3() -> Quiz {
            return Quiz(id: "QM_ADDITIONS_3",
                        title: "🔴 Additions",
                        description: "This quiz contains hard additions that could improve your " +
                        "math skills. You will enjoy hard additions between numbers from 0 to 100.",
                        items: QuizItemData.MathItems.generate(mathItems: 20,
                                                               difficulty: .hard,
                                                               qOperator: .add),
                        category: QuizCategory.math,
                        difficulty: .hard)
        }
        
        func addition4() -> Quiz {
            return Quiz(id: "QM_ADDITIONS_4",
                        title: "⚫️ Additions",
                        description: "This quiz contains insane additions that could improve your " +
                        "math skills. You will enjoy insane additions between numbers from 0 to 10000.",
                        items: QuizItemData.MathItems.generate(mathItems: 20,
                                                               difficulty: .insane,
                                                               qOperator: .add),
                        category: QuizCategory.math,
                        difficulty: .insane)
        }
        
        func subtraction1() -> Quiz {
            return Quiz(id: "QM_SUBTRACTIONS_1",
                        title: "🟢 Subtractions",
                        description: "This quiz contains easy subtractions that could improve your " +
                        "math skills. You will enjoy easy subtractions between numbers from 0 to 15.",
                        items: QuizItemData.MathItems.generate(mathItems: 20,
                                                               difficulty: .easy,
                                                               qOperator: .substract),
                        category: QuizCategory.math,
                        difficulty: .easy)
        }
        
        func subtraction2() -> Quiz {
            return Quiz(id: "QM_SUBTRACTIONS_2",
                        title: "🟡 Subtractions",
                        description: "This quiz contains subtractions that could improve your " +
                        "math skills. You will enjoy normal subtractions between numbers from 0 to 50.",
                        items: QuizItemData.MathItems.generate(mathItems: 20,
                                                               difficulty: .normal,
                                                               qOperator: .substract),
                        category: QuizCategory.math,
                        difficulty: .normal)
        }
        
        func subtraction3() -> Quiz {
            return Quiz(id: "QM_SUBTRACTIONS_3",
                        title: "🔴 Subtractions",
                        description: "This quiz contains hard subtractions that could improve your " +
                        "math skills. You will enjoy hard subtractions between numbers from 0 to 100.",
                        items: QuizItemData.MathItems.generate(mathItems: 20,
                                                               difficulty: .hard,
                                                               qOperator: .substract),
                        category: QuizCategory.math,
                        difficulty: .hard)
        }
        
        func subtraction4() -> Quiz {
            return Quiz(id: "QM_SUBTRACTIONS_4",
                        title: "⚫️ Subtractions",
                        description: "This quiz contains insane additions that could improve your " +
                        "math skills. You will enjoy insane additions between numbers from 0 to 10000.",
                        items: QuizItemData.MathItems.generate(mathItems: 20,
                                                               difficulty: .insane,
                                                               qOperator: .substract),
                        category: QuizCategory.math,
                        difficulty: .insane)
        }
        
        func multiplications1() -> Quiz {
            return Quiz(id: "QM_MULTIPLICATIONS_1",
                        title: "🟢 Multiplications",
                        description: "This quiz contains easy multiplications that could improve your " +
                        "math skills. You will enjoy easy multiplications between numbers from 0 to 10.",
                        items: QuizItemData.MathItems.generate(mathItems: 20,
                                                               difficulty: .easy,
                                                               qOperator: .multiply),
                        category: QuizCategory.math,
                        difficulty: .easy)
        }
        
        func multiplications2() -> Quiz {
            return Quiz(id: "QM_MULTIPLICATIONS_2",
                        title: "🟡 Multiplications",
                        description: "This quiz contains multiplications that could improve your " +
                        "math skills. You will enjoy normal multiplications between numbers from 0 to 15.",
                        items: QuizItemData.MathItems.generate(mathItems: 20,
                                                               difficulty: .normal,
                                                               qOperator: .multiply),
                        category: QuizCategory.math,
                        difficulty: .normal)
        }
        
        func multiplications3() -> Quiz {
            return Quiz(id: "QM_MULTIPLICATIONS_3",
                        title: "🔴 Multiplications",
                        description: "This quiz contains hard multiplications that could improve your " +
                        "math skills. You will enjoy hard multiplications between numbers from 0 to 20.",
                        items: QuizItemData.MathItems.generate(mathItems: 20,
                                                               difficulty: .hard,
                                                               qOperator: .multiply),
                        category: QuizCategory.math,
                        difficulty: .hard)
        }
        
        func multiplications4() -> Quiz {
            return Quiz(id: "QM_MULTIPLICATIONS_4",
                        title: "⚫️ Multiplications",
                        description: "This quiz contains insane multiplications that could improve your " +
                        "math skills. You will enjoy insanw multiplications between numbers from 0 to 50.",
                        items: QuizItemData.MathItems.generate(mathItems: 20,
                                                               difficulty: .insane,
                                                               qOperator: .multiply),
                        category: QuizCategory.math,
                        difficulty: .insane)
        }
        
        func divisions1() -> Quiz {
            return Quiz(id: "QM_DIVISIONS_1",
                        title: "🟢 Divisions",
                        description: "This quiz contains easy divisions that could improve your " +
                        "math skills. You will enjoy easy divisions between numbers from 0 to 10.",
                        items: QuizItemData.MathItems.generate(mathItems: 20,
                                                               difficulty: .easy,
                                                               qOperator: .division),
                        category: QuizCategory.math,
                        difficulty: .easy)
        }
        
        func divisions2() -> Quiz {
            return Quiz(id: "QM_DIVISIONS_2",
                        title: "🟡 Divisions",
                        description: "This quiz contains divisions that could improve your " +
                        "math skills. You will enjoy normal divisions between numbers from 0 to 15.",
                        items: QuizItemData.MathItems.generate(mathItems: 20,
                                                               difficulty: .normal,
                                                               qOperator: .division),
                        category: QuizCategory.math,
                        difficulty: .normal)
        }
        
        func divisions3() -> Quiz {
            return Quiz(id: "QM_DIVISIONS_3",
                        title: "🔴 Divisions",
                        description: "This quiz contains hard divisions that could improve your " +
                        "math skills. You will enjoy hard divisions between numbers from 0 to 20.",
                        items: QuizItemData.MathItems.generate(mathItems: 20,
                                                               difficulty: .hard,
                                                               qOperator: .division),
                        category: QuizCategory.math,
                        difficulty: .hard)
        }
        
        func divisions4() -> Quiz {
            return Quiz(id: "QM_DIVISIONS_4",
                        title: "⚫️ Divisions",
                        description: "This quiz contains insane divisions that could improve your " +
                        "math skills. You will enjoy insane divisions between numbers from 0 to 50.",
                        items: QuizItemData.MathItems.generate(mathItems: 20,
                                                               difficulty: .insane,
                                                               qOperator: .division),
                        category: QuizCategory.math,
                        difficulty: .insane)
        }
    }
    
    struct Geography {
        
        func capitals1() -> Quiz {
            
            return Quiz(id: "QM_CAPITALS_1",
                        title: "Guess the capital",
                        description: "Simple. Quick. We ask countries. You answer capitals.",
                        items: QuizItemData.GeneralQuestions.generate(model: Country.self, items: 20, csv: .countryCapitals),
                        category: QuizCategory.geography,
                        difficulty: .normal)
        }
        
        func geography1() -> Quiz {
            
            return Quiz(id: "QM_GEOGRAPHY_1",
                        title: "Mix",
                        description: "Rivers, mountains, volcanos ...",
                        items: QuizItemData.GeneralQuestions.generateGeneral(items: 20),
                        category: QuizCategory.geography,
                        difficulty: .normal)
        }
    }
    
    struct Companies {
        
        func mottos1() -> Quiz {
            
            return Quiz(id: "QM_MOTTOS_1",
                        title: "Mottos",
                        description: "Let's test how much influence do corporations have in marketing. " +
                            "This quiz is going to test if you know random company mottos.",
                        items: QuizItemData.GeneralQuestions.generate(model: Company.self, items: 20, csv: CSVs.mottos1),
                        category: QuizCategory.corporate,
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
                let qA = qOperator.compute(left: r1, right: r2)
                let qT = "\(r1.clean) \(qOperator.symbol()) \(r2.clean) = ?"
                
                let quizTime = time
                
                let incorrects: [String] = [
                    "\((qA + Double(Int(qA/4*2)) - Double(Int.random(in: 1...3))).clean)",
                    "\((qA - Double(Int(qA/2)) - Double(Int.random(in: 1...3))).clean)",
                    "\((qA + Double(Int(qA/2)) + Double(Int.random(in: 1...3))).clean)",
                ]
                let quizAnsw = QuizItemAnswer(type: .singleChoice,
                                              answer: [qA.clean],
                                              incorrects: incorrects)
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
        
        
        static func generate<Model: Quizable & CSVParsable>(model: Model.Type,
                                                            items: Int,
                                                            csv: CSVs) -> [QuizItem] {
            var generatedQuizItems: [QuizItem] = []
            let parsedCountries: [Model] = CSVManager.parseCSV(csv: csv)
            for _ in 0..<items {
                let r1 = parsedCountries.randomElement()!
                let quizItem = r1.quizItem(extraModels: parsedCountries)
                generatedQuizItems.append(quizItem)
            }
            return generatedQuizItems
        }
    }
}

struct QuizMessageData {
    
    static func da<Model: Quizable & CSVParsable>(arr: [Model]) -> QuizItem {
        return QuizItem(id: UUID(), text: "", time: QuizItemTime(), answer: QuizItemAnswer(type: .numeric, answer: []), category: .math)
    }
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
