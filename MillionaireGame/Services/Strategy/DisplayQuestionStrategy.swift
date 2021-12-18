//
//  DisplayQuestionStrategy.swift
//  MillionaireGame
//
//  Created by Егор Кожемин on 18.12.2021.
//

protocol DisplayQuestionStrategy {
    func displayQuestion() -> Question?
}

final class RandomDisplayQuestionStrategy: DisplayQuestionStrategy {
    private var questionList: [Question]
    private var currentQuestionIndex = -1
    private lazy var shuffleQuestionList: [Question] = {
        questionList.shuffled()
    }()

    init(q: [Question]) {
        questionList = q
    }

    func displayQuestion() -> Question? {
        currentQuestionIndex += 1
        if !(currentQuestionIndex >= questionList.startIndex && currentQuestionIndex < questionList.endIndex) {
            return nil
        }

        return shuffleQuestionList[currentQuestionIndex]
    }
}

final class SequentialDisplayQuestionStrategy: DisplayQuestionStrategy {
    private var questionList: [Question] = []
    private var currentQuestionIndex = -1

    init(q: [Question]) {
        questionList = q
    }

    func displayQuestion() -> Question? {
        currentQuestionIndex += 1
        if !(currentQuestionIndex >= questionList.startIndex && currentQuestionIndex < questionList.endIndex) {
            return nil
        }
        return questionList[currentQuestionIndex]
    }
}
