//
//  Operator.swift
//  BrainStress
//
//  Created by Robert Sandru on 07/10/2020.
//

import Foundation

enum Operator {
    case add
    case substract
    case multiply
    case division
    
    func symbol() -> String {
        switch self {
        case .add: return "+"
        case .substract: return "-"
        case .multiply: return "*"
        case .division: return "/"
        }
    }
    
    func compute(left: Double, right: Double) -> Double {
        switch self {
        case .add: return left + right
        case .substract: return left - right
        case .multiply: return left * right
        case .division: return left / right
        }
    }
}
