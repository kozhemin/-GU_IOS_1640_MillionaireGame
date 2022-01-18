//
//  AddNewQuestionViewController.swift
//  MillionaireGame
//
//  Created by Егор Кожемин on 19.12.2021.
//

import UIKit

struct TextFieldList {
    var answerField: UITextField
    var scoreField: UITextField
}

class AddNewQuestionViewController: UIViewController {
    @IBOutlet var questionTextView: UITextView!
    @IBOutlet var addNewAnswerButton: UIButton!
    @IBOutlet var answersTable: UITableView!
    @IBOutlet var saveButton: UIButton!

    var questionDataProvider: QuestionDataProvider?

    private var answerRows = [Int]()
    private var textFieldList = [TextFieldList]()

    override func viewDidLoad() {
        super.viewDidLoad()
        answersTable.dataSource = self
        answersTable.register(TableViewCell.self, forCellReuseIdentifier: "AddNewQuestionCell")

        questionTextView.delegate = self
        questionTextView.becomeFirstResponder()
    }

    @IBAction func tapSaveAnswer(_: Any) {
        let questiobBuilder = BuilderQuestion(question: questionTextView.text)
        for field in textFieldList {
            questiobBuilder.addAnswer(answer: Answer(
                title: field.answerField.text ?? "",
                score: Int(field.scoreField.text ?? "") ?? 0
            )
            )
        }

        if questiobBuilder.validateAnswers() {
            let newQuestion = questiobBuilder.build()
            questionDataProvider?.setQuestion(newQuestion: newQuestion!)
            dismiss(animated: true, completion: nil)
        } else {
            let alert = UIAlertController(
                title: "Error",
                message: "Ошибка при созаднии вопроса!",
                preferredStyle: .alert
            )

            alert.addAction(
                UIAlertAction(
                    title: "OK",
                    style: .cancel,
                    handler: nil
                )
            )

            present(alert, animated: true, completion: nil)
        }
    }

    @IBAction func tapAddAnswer(_: Any) {
        let newRowIndex = answerRows.count

        answerRows.append(newRowIndex + 1)

        let indexPath = IndexPath(row: newRowIndex, section: 0)
        let indexPaths = [indexPath]
        answersTable.insertRows(at: indexPaths, with: .automatic)
    }
}

class TableViewCell: UITableViewCell {}

extension AddNewQuestionViewController: UITableViewDataSource {
    func tableView(_: UITableView, numberOfRowsInSection _: Int) -> Int {
        answerRows.count
    }

    func tableView(_: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = answersTable.dequeueReusableCell(withIdentifier: "AddNewQuestionCell", for: indexPath) as! TableViewCell

        cell.textLabel?.text = ""

        let anwerTxtField = UITextField(frame: CGRect(x: 0, y: 5, width: 230.00, height: 30.00))
        anwerTxtField.placeholder = "Enter answer"
        anwerTxtField.keyboardType = UIKeyboardType.default
        anwerTxtField.returnKeyType = UIReturnKeyType.done
        anwerTxtField.clearButtonMode = UITextField.ViewMode.whileEditing
        anwerTxtField.contentVerticalAlignment = UIControl.ContentVerticalAlignment.center

        let scoreTxtField = UITextField(frame: CGRect(x: 250, y: 5, width: 90.00, height: 30.00))
        scoreTxtField.placeholder = "Enter score"
        scoreTxtField.keyboardType = UIKeyboardType.numberPad
        scoreTxtField.returnKeyType = UIReturnKeyType.done
        scoreTxtField.clearButtonMode = UITextField.ViewMode.whileEditing
        scoreTxtField.contentVerticalAlignment = UIControl.ContentVerticalAlignment.center

        anwerTxtField.delegate = self
        scoreTxtField.delegate = self

        textFieldList.append(TextFieldList(answerField: anwerTxtField, scoreField: scoreTxtField))

        cell.addSubview(anwerTxtField)
        cell.addSubview(scoreTxtField)

        return cell
    }
}

extension AddNewQuestionViewController: UITextViewDelegate {
    func textView(_ textView: UITextView, shouldChangeTextIn _: NSRange, replacementText text: String) -> Bool {
        if text == "\n" {
            textView.resignFirstResponder()
            return false
        }
        return true
    }
}

extension AddNewQuestionViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
}
