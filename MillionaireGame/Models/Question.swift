//
//  Question.swift
//  MillionaireGame
//
//  Created by Егор Кожемин on 14.12.2021.
//
import Foundation

struct Question: Codable {
    var title: String
    var answers: [Answer]
}

struct Answer: Codable {
    var title: String
    var score: Int
    var isRight: Bool {
        score > 0
    }
}
