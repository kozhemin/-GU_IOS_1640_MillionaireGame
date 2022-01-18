//
//  BuilderQuestion.swift
//  MillionaireGame
//
//  Created by Егор Кожемин on 20.12.2021.
//

import Foundation

class BuilderQuestion {
    var question: String
    var answers = [Answer]()

    init(question: String) {
        self.question = question
    }

    func build() -> Question? {
        guard answers.count > 0,
              !question.isEmpty
        else { return nil }

        return Question(title: question, answers: answers)
    }

    func addAnswer(answer: Answer) {
        answers.append(answer)
    }

    func validateAnswers() -> Bool {
        var hasScore = false

        for answer in answers {
            if answer.title.isEmpty {
                return false
            }
            if answer.score > 0 {
                hasScore = true
            }
        }
        return hasScore && answers.count > 0
    }
}
