//
//  ResultViewController.swift
//  MillionaireGame
//
//  Created by Егор Кожемин on 14.12.2021.
//

import UIKit

class ResultViewController: UIViewController {
    private var resultData = [GameResult]()

    @IBOutlet var resultTableView: UITableView!

    override func viewDidLoad() {
        super.viewDidLoad()
        resultTableView.dataSource = self

        registerNib()
        resultData = Game.shared.getAllGameResults().reversed()
        resultTableView.reloadData()
    }

    private func registerNib() {
        let nibResult = UINib(nibName: "ResultCell", bundle: nil)
        resultTableView.register(nibResult, forCellReuseIdentifier: "ResultCell")
    }
}

extension ResultViewController: UITableViewDataSource {
    func tableView(_: UITableView, numberOfRowsInSection _: Int) -> Int {
        resultData.count
    }

    func tableView(_: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = resultTableView.dequeueReusableCell(withIdentifier: "ResultCell", for: indexPath) as! ResultCell
        cell.configure(data: resultData[indexPath.row])
        return cell
    }

    func tableView(_: UITableView, heightForRowAt _: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }

    func tableView(_: UITableView, estimatedHeightForRowAt _: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
}
