//
//  Double.swift
//  BrainStress
//
//  Created by Robert Sandru on 07/10/2020.
//

import Foundation

extension Double {
    var clean: String {
        let formatter = NumberFormatter()
        formatter.minimumFractionDigits = 0
        formatter.maximumFractionDigits = 2

        // Avoid not getting a zero on numbers lower than 1
        // Eg: .5, .67, etc...
        formatter.numberStyle = .decimal
        return formatter.string(from: self as NSNumber) ?? "n/a"
    }
}
