//
//  Game.swift
//  MillionaireGame
//
//  Created by Егор Кожемин on 15.12.2021.
//

import Foundation

class Game {
    static var shared = Game()
    var gameMode = GameMode.sequential
    var gameSession: GameSession?
    private var gameResults = [GameResult]()

    private init() {}

    func gameOver() {
        guard let gameSession = gameSession else { return }
        gameResults.append(
            GameResult(allQuestion: gameSession.cnAllQuestion,
                       righAnswer: gameSession.getCnRightAnswer(),
                       allScore: gameSession.getPrizeFund(),
                       isWinner: gameSession.isWinner,
                       rightPct: getPct()))

        self.gameSession = nil
    }

    func getPct() -> Double {
        guard let gameSession = gameSession else { return 0.0 }
        return (Double(gameSession.getCnRightAnswer()) / Double(gameSession.cnAllQuestion)) * 100
    }

    func getAllGameResults() -> [GameResult] {
        return gameResults
    }

    func setAllGameResults(resulsts: [GameResult]) {
        gameResults = resulsts
    }
}

extension Game: NSCopying {
    func copy(with _: NSZone? = nil) -> Any {
        return self
    }
}
