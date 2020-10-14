//
//  CSVManager.swift
//  BrainStress
//
//  Created by Robert Sandru on 13/10/2020.
//

import Foundation
import SwiftCSV

enum CSVs: String {
    case countryCapitals = "Country_Capitals"
    case geography1 = "Geography_1"
}

class CSVManager {
    
    static func parseCountryCapitalsCSV() -> [Country] {
        var country: [Country] = []
        let fileCSV: CSV?
        do {
            fileCSV = try CSV(name: CSVs.countryCapitals.rawValue,
                              extension: "csv",
                              bundle: Bundle.main,
                              delimiter: ";",
                              encoding: .utf8,
                              loadColumns: true)
        } catch {
            return []
        }
        guard fileCSV != nil else { return [] }
        let namedRows = fileCSV!.namedRows
        for row in namedRows {
            guard let rCountry = row["Country"],
                  let rCapital = row["Capital"] else {
                break
            }
            
            country.append(Country(name: rCountry, capital: rCapital))
        }
        return country
    }
    
    static func parseGeneralQuestions(csv: CSVs) -> [GeneralQuestion] {
        var questions: [GeneralQuestion] = []
        let fileCSV: CSV?
        do {
            fileCSV = try CSV(name: csv.rawValue,
                              extension: "csv",
                              bundle: Bundle.main,
                              delimiter: ";",
                              encoding: .utf8,
                              loadColumns: true)
        } catch {
            return []
        }
        guard fileCSV != nil else { return [] }
        let namedRows = fileCSV!.namedRows
        for row in namedRows {
            guard let rQuestion = row["Question"],
                  let rAnswer = row["Answer"] else {
                break
            }
            
            var question = GeneralQuestion(question: rQuestion, answer: rAnswer)
            if let incorrects = row["Incorrects"] {
                question.incorrects = incorrects.split(separator: ",").map({ ss in
                    String(ss)
                })
            }
            
            questions.append(question)
        }
        return questions
    }
}
