//
//  StatsViewController.swift
//  FinalProject
//
//  Created by PCI0001 on 9/14/20.
//  Copyright © 2020 Thinh Nguyen X. All rights reserved.
//

import UIKit

final class StatsViewController: ViewController {

    // MARK: - IBOulets
    @IBOutlet private weak var tableView: UITableView!

    // MARK: - Properties
    var viewModel: StatsViewModel = StatsViewModel()

    // MARK: - Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        loadDataCellOne()
        loadDataCellThree()
        loadDataCellRank()
    }

    // MARK: - Override methods
    override func setUpUI() {
        tableView.register(nibWithCellClass: StatsCellOneTableViewCell.self)
        tableView.register(nibWithCellClass: StatsCellTwoTableViewCell.self)
        tableView.register(nibWithCellClass: StatsCellThreeTableViewCell.self)
        tableView.register(nibWithCellClass: StatsCellFourTableViewCell.self)
        tableView.register(nibWithCellClass: StatsCellFiveTableViewCell.self)
        tableView.register(nibWithCellClass: CellRankTableViewCell.self)
        tableView.delegate = self
        tableView.dataSource = self
        title = "Statistics"
    }

    // MARK: - Private methods
    private func loadDataCellOne() {
        viewModel.getDataCellOne { [weak self] result in
            guard let this = self else { return }
            switch result {
            case .success:
                DispatchQueue.main.async {
                    this.tableView.reloadData()
                }
            case .failure(let error):
                DispatchQueue.main.async {
                    this.alert(error: error)
                }
            }
        }
    }

    private func loadDataCellThree() {
        viewModel.getDataCellThree { [weak self] result in
            guard let this = self else { return }
            switch result {
            case .success:
                DispatchQueue.main.async {
                    this.tableView.reloadData()
                }
            case .failure(let error):
                DispatchQueue.main.async {
                    this.alert(error: error)
                }
            }
        }
    }

    private func loadDataCellRank() {
        viewModel.getDataCellRank { [weak self] result in
            guard let this = self else { return }
            switch result {
            case .success:
                DispatchQueue.main.async {
                    this.tableView.reloadData()
                }
            case .failure(let error):
                DispatchQueue.main.async {
                    this.alert(error: error)
                }
            }
        }
    }
}

// MARK: - Extension UITableViewDataSource
extension StatsViewController: UITableViewDataSource {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.numberOfRowInsection()
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch indexPath.row {
        case 0:
            let cellOne = tableView.dequeueReusableCell(withClass: StatsCellOneTableViewCell.self, for: indexPath)
            cellOne.viewModel = viewModel.viewModelForCellOne(at: indexPath)
            return cellOne
        case 1:
            let cellTwo = tableView.dequeueReusableCell(withClass: StatsCellTwoTableViewCell.self, for: indexPath)
            cellTwo.viewModel = viewModel.viewModelForCellOne(at: indexPath)
            return cellTwo
        case 2:
            let cellThree = tableView.dequeueReusableCell(withClass: StatsCellThreeTableViewCell.self, for: indexPath)
            cellThree.viewModel = viewModel.viewModelForCellThree(at: indexPath)
            return cellThree
        case 3:
            let cellFour = tableView.dequeueReusableCell(withClass: StatsCellFourTableViewCell.self, for: indexPath)
            cellFour.viewModel = viewModel.viewModelForCellThree(at: indexPath)
            return cellFour
        case 4:
            let cellFive = tableView.dequeueReusableCell(withClass: StatsCellFiveTableViewCell.self, for: indexPath)
            return cellFive
        case 5 ... 20:
            let cellRank = tableView.dequeueReusableCell(withClass: CellRankTableViewCell.self, for: indexPath)
            cellRank.viewModel = viewModel.viewModelForCellRank(at: indexPath)
            return cellRank
        default:
            return UITableViewCell()
        }
    }
}

// MARK: - Extension UITableViewDelegate
extension StatsViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        switch indexPath.row {
        case 0:
            return 100
        case 1:
            return 180
        case 2:
            return 120
        case 3:
            return 180
        case 4:
            return 50
        default:
            return UITableView.automaticDimension
        }
    }
}
