//
//  GameConfigViewController.swift
//  MillionaireGame
//
//  Created by Егор Кожемин on 19.12.2021.
//

import UIKit

class GameConfigViewController: UIViewController {
    @IBOutlet var modeSegmentControl: UISegmentedControl!

    override func viewDidLoad() {
        super.viewDidLoad()
        modeSegmentControl.selectedSegmentIndex = Game.shared.gameMode.rawValue
    }

    @IBAction func changeMode(_: Any) {
        switch modeSegmentControl.selectedSegmentIndex {
        case 0:
            Game.shared.gameMode = .sequential
        case 1:
            Game.shared.gameMode = .random
        default:
            break
        }
    }
}
