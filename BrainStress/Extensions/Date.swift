//
//  Date.swift
//  BrainStress
//
//  Created by Robert Sandru on 25/10/2020.
//

import Foundation

extension Date {
    
    static func secondsToHoursMinutesSeconds (seconds : Int) -> (Int, Int, Int) {
        return (seconds / 3600, (seconds % 3600) / 60, (seconds % 3600) % 60)
    }
}
