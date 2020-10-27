//
//  UserDefaultsManager.swift
//  BrainStress
//
//  Created by Robert Sandru on 06/10/2020.
//

import Foundation

class UserDefaultsManager {
    
    static let shared = UserDefaultsManager()
}

// MARK: User Identifier
extension UserDefaultsManager {
    func set(nickname: String) {
        UserDefaults.standard.setValue(nickname, forKey: Constants.kUserNickname)
    }
    
    func getNickname() -> String {
        return UserDefaults.standard.string(forKey: Constants.kUserNickname) ?? ""
    }
}

// MARK: Quiz Data
extension UserDefaultsManager {
    
    func getWins(quizId: String) -> Int {
        let kWins = Constants.kQuizWins(quizId: quizId)
        return UserDefaults.standard.integer(forKey: kWins)
    }
    
    func getFails(quizId: String) -> Int {
        let kFail = Constants.kQuizFails(quizId: quizId)
        return UserDefaults.standard.integer(forKey: kFail)
    }
 
    func getPlays(quizId: String) -> Int {
        let wins = getWins(quizId: quizId)
        let fail = getFails(quizId: quizId)
        
        return wins + fail
    }
    
    func increaseWins(quizId: String) {
        let wins = getWins(quizId: quizId)
        let kWins = Constants.kQuizWins(quizId: quizId)
        UserDefaults.standard.setValue(wins + 1, forKey: kWins)
    }
    
    func increaseFails(quizId: String) {
        let fails = getFails(quizId: quizId)
        let kFails = Constants.kQuizFails(quizId: quizId)
        UserDefaults.standard.setValue(fails + 1, forKey: kFails)
    }
}

extension UserDefaultsManager {
    
    func set(showAlertOnHome: Bool) {
        UserDefaults.standard.setValue(showAlertOnHome, forKey: Constants.homeViewWelcomeAlertShown)
    }
    
    func getShowAlertOnHome() -> Bool {
        UserDefaults.standard.bool(forKey: Constants.homeViewWelcomeAlertShown)
    }
}
