//
//  GameResultStorage.swift
//  MillionaireGame
//
//  Created by Егор Кожемин on 16.12.2021.
//

import Foundation

final class GameResultStorage {
    private let decoder = JSONDecoder()
    private let encoder = JSONEncoder()
    private let key = "gameResultStorage"

    func save(records: [GameResult]) {
        do {
            let data = try encoder.encode(records)
            UserDefaults.standard.set(data, forKey: key)
        } catch {
            print(error)
        }
    }

    func retrieveRecords() -> [GameResult] {
        guard let data = UserDefaults.standard.data(forKey: key) else {
            return []
        }
        do {
            return try decoder.decode([GameResult].self, from: data)
        } catch {
            print(error)
            return []
        }
    }
}
