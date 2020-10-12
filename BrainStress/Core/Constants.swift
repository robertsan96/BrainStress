//
//  Constants.swift
//  BrainStress
//
//  Created by Robert Sandru on 06/10/2020.
//

import Foundation

struct Constants {
    
    static let kUserNickname = "USER_NICKNAME"
    
    static let categories = [
        Category(name: "Math"),
        Category(name: "Tricky Questions"),
        Category(name: "Capitals"),
        Category(name: "Countries")
    ]
    
    static func kQuizWins(quizId: String) -> String {
        return "\(quizId)_QUIZ_WINS"
    }
    
    static func kQuizFails(quizId: String) -> String {
        return "\(quizId)_QUIZ_FAILS"
    }
    
}
