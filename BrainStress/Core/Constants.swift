//
//  Constants.swift
//  BrainStress
//
//  Created by Robert Sandru on 06/10/2020.
//

import Foundation

struct Constants {
    
    static let kUserNickname = "USER_NICKNAME"
    static let homeViewWelcomeAlertShown = "SHOW_ALERT_ON_WELCOME"
    
    static func kQuizWins(quizId: String) -> String {
        return "\(quizId)_QUIZ_WINS"
    }
    
    static func kQuizFails(quizId: String) -> String {
        return "\(quizId)_QUIZ_FAILS"
    }
    
}
