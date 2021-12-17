//
//  Question.swift
//  MillionaireGame
//
//  Created by Егор Кожемин on 14.12.2021.
//

struct Question {
    var title: String
    var answers: [Answer]
}

struct Answer {
    var title: String
    var score: Int
    var isRight: Bool {
        score > 0
    }
}
