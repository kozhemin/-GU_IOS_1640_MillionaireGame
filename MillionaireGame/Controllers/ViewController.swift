//
//  ViewController.swift
//  MillionaireGame
//
//  Created by Егор Кожемин on 14.12.2021.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet var startGameButton: UIButton!
    @IBOutlet var resultGameButton: UIButton!

    private let gameResultStorage = GameResultStorage()

    override func viewDidLoad() {
        super.viewDidLoad()

        Game.shared.setAllGameResults(resulsts: gameResultStorage.retrieveRecords())
        configureView()
    }

    private func configureView() {
        startGameButton.layer.borderColor = UIColor.white.cgColor
        startGameButton.layer.borderWidth = 1.0
        startGameButton.backgroundColor = .clear
        startGameButton.layer.cornerRadius = 5
    }

    override func prepare(for segue: UIStoryboardSegue, sender _: Any?) {
        switch segue.identifier {
        case "StartGameSegue":
            guard let vc = segue.destination as? GameViewController else { return }
            let gameSession = GameSession()
            Game.shared.gameSession = gameSession
            vc.gameDelegate = gameSession

            //        case "ResultGameSegue":
            //            guard let vc = segue.destination as? ResultViewController else { return }

        default:
            return
        }
    }
}
