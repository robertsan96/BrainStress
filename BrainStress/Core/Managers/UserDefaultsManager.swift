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
