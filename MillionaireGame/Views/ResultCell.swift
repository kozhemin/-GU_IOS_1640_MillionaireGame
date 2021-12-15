//
//  ResultCell.swift
//  MillionaireGame
//
//  Created by Егор Кожемин on 15.12.2021.
//

import UIKit

class ResultCell: UITableViewCell {
    @IBOutlet var cnQuestionLabel: UILabel!
    @IBOutlet var cnAnswerLabel: UILabel!
    @IBOutlet var cnPctLabel: UILabel!
    @IBOutlet var isWinnerLabel: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }

    func configure(data: GameResult) {
        cnQuestionLabel.text = data.allQuestion.description
        cnAnswerLabel.text = data.righAnswer.description
        cnPctLabel.text = data.rightPct.description
        isWinnerLabel.text = data.isWinner ? "Да" : "Нет"

        if data.isWinner {
            isWinnerLabel.textColor = .green
        }
    }
}
