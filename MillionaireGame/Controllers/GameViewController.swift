//
//  GameViewController.swift
//  MillionaireGame
//
//  Created by Егор Кожемин on 14.12.2021.
//

import UIKit

class GameViewController: UIViewController {
    var gameDelegate: GameSessionProtocol?
    
    @IBOutlet var questionLabel: UILabel!
    @IBOutlet var answerTableView: UITableView!

    private let gameResultStorage = GameResultStorage()
    private let questionDataProvider = QuestionDataProvider()
    private var currentQuestion: Question?

    lazy private var createQuestionStrategy: DisplayQuestionStrategy = {
        let allQuestion = questionDataProvider.getAllQuestion()
        
        switch Game.shared.gameMode {
        case .sequential:
            return SequentialDisplayQuestionStrategy(q: allQuestion)
        case .random:
            return RandomDisplayQuestionStrategy(q: allQuestion)
        }
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        answerTableView.dataSource = self
        answerTableView.delegate = self
        
        gameDelegate?.cnAllQuestion = questionDataProvider.getCount()
        displayNewQuestion()
    }

    // MARK: Отображение нового вопроса в зависимости от текущей стратегии
    
    private func displayNewQuestion() {
        guard let currentQuestion = questionDataProvider.getQuestion(strategy: createQuestionStrategy)
        else { return endOfGame()}
        
        self.currentQuestion = currentQuestion
        questionLabel.text = currentQuestion.title
        answerTableView.reloadData()
    }

    private func checkAnswer(answer: Answer) {
        if answer.isRight {
            gameDelegate?.appendRightAnswer(score: answer.score)
            displayNewQuestion()
        } else {
            endOfGame()
        }
    }

    private func endOfGame() {
        dismiss(animated: true, completion: nil)
        Game.shared.gameOver()
        gameResultStorage.save(records: Game.shared.getAllGameResults())
    }
}

extension GameViewController: UITableViewDataSource {
    func tableView(_: UITableView, numberOfRowsInSection _: Int) -> Int {
        currentQuestion?.answers.count ?? 0
    }

    func tableView(_: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let dataCell = currentQuestion?.answers[indexPath.row]
        let cell = UITableViewCell(style: .default, reuseIdentifier: "AnswerCell")

        var conf = cell.defaultContentConfiguration()
        conf.text = dataCell?.title
        conf.textProperties.color = .white

        cell.contentConfiguration = conf
        cell.backgroundColor = UIColor(named: "200852")
        cell.textLabel?.textColor = .white

        return cell
    }
}

extension GameViewController: UITableViewDelegate {
    func tableView(_: UITableView, didSelectRowAt indexPath: IndexPath) {
        let alert = UIAlertController(
            title: "Confirm",
            message: "Are you sure?",
            preferredStyle: .actionSheet
        )

        alert.addAction(
            UIAlertAction(
                title: NSLocalizedString("Yes", comment: "Default action"),
                style: .default,
                handler: { [weak self] _ in
                    guard let answer = self?.currentQuestion?.answers[indexPath.row] else {
                        return
                    }
                    self?.checkAnswer(answer: answer)
                }
            )
        )

        alert.addAction(
            UIAlertAction(
                title: "Cancel",
                style: .cancel,
                handler: nil
            )
        )

        present(alert, animated: true, completion: nil)
        answerTableView.cellForRow(at: indexPath)?.setSelected(false, animated: true)
    }
}
