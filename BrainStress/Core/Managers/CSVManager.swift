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
    case mottos1 = "Mottos_1"
}

class CSVManager {
    
    static func parseCSV<Model: CSVParsable>(csv: CSVs) -> [Model] {
        var parsedModels: [Model] = []
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
            var model = Model()
            for column in Model.csvColumns {
                let rowValue = row[column]
                let columnRow = CSVColumn(value: column)
                let columnValue = CSVValue(value: rowValue ?? "")
                model.csv(parsed: (column: columnRow, value: columnValue))
            }
            parsedModels.append(model)
        }
        return parsedModels
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
