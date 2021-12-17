//
//  QuestionDataProvider.swift
//  MillionaireGame
//
//  Created by Егор Кожемин on 18.12.2021.
//

final class QuestionDataProvider {
    
    private var questionList = [
        Question(title: "В каком из этих фильмов не снимался Александр Абдулов?", answers: [
            Answer(title: "Карнавал", score: 0),
            Answer(title: "Московские каникулы", score: 1000),
            Answer(title: "Чародеи", score: 0),
            Answer(title: "Убить дракона", score: 0),
        ]),
        Question(title: "В каком году произошла Куликовская битва?", answers: [
            Answer(title: "1380 ", score: 10000),
            Answer(title: "1569", score: 0),
            Answer(title: "1616", score: 0),
            Answer(title: "1773", score: 0),
        ]),
        Question(title: "Кто автор музыки к детской песенке Чунга-Чанга?", answers: [
            Answer(title: "Шаинский", score: 100_000),
            Answer(title: "Зацепин", score: 0),
            Answer(title: "Дербенёв", score: 0),
            Answer(title: "Шпиц", score: 0),
        ]),
        Question(title: "Какой титул имел Дон Кихот?", answers: [
            Answer(title: "Барон", score: 0),
            Answer(title: "Вождь", score: 0),
            Answer(title: "Маркиз", score: 0),
            Answer(title: "Идальго", score: 1_000_000),
        ]),
    ]
    
    func getAllQuestion() -> [Question] {
        return questionList
    }
    
    func getCount() ->Int {
        return getAllQuestion().count
    }
    
    func getQuestion(strategy: DisplayQuestionStrategy) -> Question? {
        return strategy.displayQuestion()
    }
}
