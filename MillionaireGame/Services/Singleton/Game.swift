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
        let pct = (Double(gameSession.getCnRightAnswer()) / Double(gameSession.cnAllQuestion)) * 100

        gameResults.append(
            GameResult(allQuestion: gameSession.cnAllQuestion,
                       righAnswer: gameSession.getCnRightAnswer(),
                       allScore: gameSession.getPrizeFund(),
                       isWinner: gameSession.isWinner,
                       rightPct: Double(pct)))

        self.gameSession = nil
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
