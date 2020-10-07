//
//  Difficulty.swift
//  BrainStress
//
//  Created by Robert Sandru on 07/10/2020.
//

import Foundation

enum Difficulty {
    case easy
    case normal
    case hard
    
    func mathInterval() -> ClosedRange<Int> {
        switch self {
        case .easy: return 0...50
        case .normal: return 25...100
        case .hard: return 50...250
        }
    }
}
