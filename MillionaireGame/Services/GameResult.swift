//
//  GameResult.swift
//  MillionaireGame
//
//  Created by Егор Кожемин on 16.12.2021.
//
import Foundation

struct GameResult: Codable {
    var allQuestion: Int
    var righAnswer: Int
    var allScore: Int
    var isWinner: Bool
    var rightPct: Double
}
