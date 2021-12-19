//
//  QuestionStorage.swift
//  MillionaireGame
//
//  Created by Егор Кожемин on 20.12.2021.
//

import Foundation

final class QuestionStorage {
    private let decoder = JSONDecoder()
    private let encoder = JSONEncoder()
    private let key = "questionStorage"

    func save(records: [Question]) {
        do {
            let data = try encoder.encode(records)
            UserDefaults.standard.set(data, forKey: key)
        } catch {
            print(error)
        }
    }

    func retrieveRecords() -> [Question] {
        guard let data = UserDefaults.standard.data(forKey: key) else {
            return []
        }
        do {
            return try decoder.decode([Question].self, from: data)
        } catch {
            print(error)
            return []
        }
    }
}
