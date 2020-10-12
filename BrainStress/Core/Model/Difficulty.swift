//
//  Difficulty.swift
//  BrainStress
//
//  Created by Robert Sandru on 07/10/2020.
//

import Foundation

enum Difficulty: String, CaseIterable {
    case easy = "Easy"
    case normal = "Normal"
    case hard = "Hard"
    case insane = "Insane"
    
    func mathInterval(forOperator: Operator) -> ClosedRange<Int> {
        switch forOperator {
        case .add:
            switch self {
            case .easy: return 0...15
            case .normal: return 0...50
            case .hard: return 0...100
            case .insane: return 0...10000
            }
        case .substract:
            switch self {
            case .easy: return 0...15
            case .normal: return 0...50
            case .hard: return 0...100
            case .insane: return 0...10000
            }
        case .division:
            switch self {
            case .easy: return 1...10
            case .normal: return 1...15
            case .hard: return 1...20
            case .insane: return 1...50
            }
        case .multiply:
            switch self {
            case .easy: return 0...10
            case .normal: return 0...15
            case .hard: return 0...20
            case .insane: return 0...50
            }
        }

    }
}
