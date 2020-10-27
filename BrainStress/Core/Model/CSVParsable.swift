//
//  CSVParsable.swift
//  BrainStress
//
//  Created by Robert Sandru on 26/10/2020.
//

import Foundation

struct CSVColumn: Hashable {
    
    var value: String
}

struct CSVValue {
    
    var value: String
}

typealias ColumnValue = (column: CSVColumn, value: CSVValue)

protocol CSVParsable {
    
    static var csvColumns: [String] { get set }
    
    init()
    
    mutating func csv(parsed: ColumnValue)
}
