//
//  DetailViewController.swift
//  FinalProject
//
//  Created by PCI0001 on 9/22/20.
//  Copyright © 2020 Thinh Nguyen X. All rights reserved.
//

import UIKit

final class DetailViewController: ViewController {

    // MARK: - IBOulets
    @IBOutlet private weak var tableView: UITableView!

    // MARK: - Properties
    private var cellIdentifierCellOne: String = "CellOne"
    private var cellIdentifierCellTwo: String = "DetailCell"
    var viewModel: DetailViewModel = DetailViewModel()

    // MARK: - Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    // MARK: - Override methods
    override func setUpUI() {
        let nibCellOne = UINib(nibName: "CellOneTableViewCell", bundle: .main)
        tableView.register(nibCellOne, forCellReuseIdentifier: cellIdentifierCellOne)
        let nibCellTwo = UINib(nibName: "DetailTableViewCell", bundle: .main)
        tableView.register(nibCellTwo, forCellReuseIdentifier: cellIdentifierCellTwo)
        tableView.delegate = self
        tableView.dataSource = self
        title = viewModel.title
    }

    // MARK: - Private methods
}

// MARK: - Extension UITableViewDataSource
extension DetailViewController: UITableViewDataSource {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.numberOfRowInSection()
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch indexPath.row {
        case 0:
            guard let cellOne = tableView.dequeueReusableCell(withIdentifier: cellIdentifierCellOne, for: indexPath) as? CellOneTableViewCell else { return UITableViewCell() }
            cellOne.viewModel = viewModel.viewModelForCellOne(at: indexPath)
            return cellOne
        case 1:
            guard let cellTwo = tableView.dequeueReusableCell(withIdentifier: cellIdentifierCellTwo, for: indexPath) as? DetailTableViewCell else {
                return UITableViewCell() }
            return cellTwo
        default:
            print("chua lam")
        }
        return UITableViewCell()
    }
}

// MARK: - Extension UITableViewDelegate
extension DetailViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        switch indexPath.row {
        case 1:
            return 300
        default:
            return UITableView.automaticDimension
        }
    }
}
