//
//  Company.swift
//  BrainStress
//
//  Created by Robert Sandru on 26/10/2020.
//

import Foundation

class Company: CSVParsable, Quizable {
    
    
    var name: String
    var motto: String
    
    static var csvColumns: [String] = ["Company", "Motto"]
    
    required init() {
        self.name = ""
        self.motto = ""
    }
    
    func csv(parsed: ColumnValue) {
        switch parsed.column.value {
        case "Company": self.name = parsed.value.value
        case "Motto": self.motto = parsed.value.value
        default: break
        }
    }
    
    func quizItem<Model>(extraModels: [Model]) -> QuizItem {
        let companies = extraModels as! [Company]
        let qT = "'\(motto)'\nbelongs to which company?"
        let answerType: QuizItemAnswerType = .singleChoice
        
        let quizTime = QuizItemTime(time: [.normal: 15])
        let quizAnsw: QuizItemAnswer
        
        let possibleIncorrects = companies
            .filter { company -> Bool in
                company.motto != motto
            }
            .shuffled()
            .prefix(3)
            .map({ c in
                c.name
            })
        quizAnsw = QuizItemAnswer(type: answerType,
                                  answer: [name],
                                  incorrects: possibleIncorrects)
        
        let quizItem = QuizItem(text: qT,
                                time: quizTime,
                                answer: quizAnsw,
                                category: QuizCategory.motto)
        
        return quizItem
    }
}
