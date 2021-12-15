//
//  GameSession.swift
//  MillionaireGame
//
//  Created by Егор Кожемин on 15.12.2021.
//

import Foundation

protocol GameSessionProtocol {
    var cnAllQuestion: Int { get set }
    func appendRightAnswer(score: Int)
}

class GameSession: GameSessionProtocol {
    var cnAllQuestion: Int
    private var cnRightAnswer = 0
    private var prizeFund = 0

    lazy var isWinner: Bool = {
        cnAllQuestion > 0 && cnAllQuestion == cnRightAnswer
    }()

    init(question: Int) {
        cnAllQuestion = question
    }

    convenience init() {
        self.init(question: 0)
    }

    func appendRightAnswer(score: Int) {
        cnRightAnswer += 1
        prizeFund += score
    }

    func getCnRightAnswer() -> Int {
        cnRightAnswer
    }

    func getPrizeFund() -> Int {
        prizeFund
    }
}
