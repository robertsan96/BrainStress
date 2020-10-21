//
//  Array.swift
//  BrainStress
//
//  Created by Robert Sandru on 21/10/2020.
//

import Foundation

extension Array {
    func chunked(into size: Int) -> [[Element]] {
        return stride(from: 0, to: count, by: size).map {
            Array(self[$0 ..< Swift.min($0 + size, count)])
        }
    }
}
