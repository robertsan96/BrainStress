//
//  Country.swift
//  BrainStress
//
//  Created by Robert Sandru on 13/10/2020.
//

import Foundation

protocol Quizable {
    
    func quizItem<Model: Quizable & CSVParsable>(extraModels: [Model]) -> QuizItem
}

class Country: CSVParsable, Quizable {

    var name: String
    var capital: String
    
    static var csvColumns: [String] = ["Country", "Capital"]
    
    required init() {
        name = ""
        capital = ""
    }
    
    func csv(parsed: ColumnValue) {
        switch parsed.column.value {
        case "Country": self.name = parsed.value.value
        case "Capital": self.capital = parsed.value.value
        default: break
        }
    }
    
    func quizItem<Model>(extraModels: [Model]) -> QuizItem where Model : CSVParsable, Model : Quizable {
        let countries = extraModels as! [Country]
        let qT = "Capital of \(name)"
        let answerType: QuizItemAnswerType = .singleChoice
        
        let quizTime = QuizItemTime(time: [.normal: 15])
        let quizAnsw: QuizItemAnswer
        
        let possibleIncorrects = countries
            .filter { country -> Bool in
                country.name != name
            }
            .shuffled()
            .prefix(Int.random(in: 1...3))
            .map({ c in
                c.capital
            })
        quizAnsw = QuizItemAnswer(type: answerType,
                                  answer: [capital],
                                  incorrects: possibleIncorrects)
        
        let quizItem = QuizItem(text: qT,
                                time: quizTime,
                                answer: quizAnsw,
                                category: QuizCategory.geography)
        
        return quizItem
    }
}
