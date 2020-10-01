//
//  StatsViewController.swift
//  FinalProject
//
//  Created by PCI0001 on 9/14/20.
//  Copyright © 2020 Thinh Nguyen X. All rights reserved.
//

import UIKit
import SVProgressHUD

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
        tableView.register(nibWithCellClass: WorldStatsTableViewCell.self)
        tableView.register(nibWithCellClass: WorldChartTableViewCell.self)
        tableView.register(nibWithCellClass: VNStatsTableViewCell.self)
        tableView.register(nibWithCellClass: VNChartTableViewCell.self)
        tableView.register(nibWithCellClass: StatsTableViewCell.self)
        tableView.register(nibWithCellClass: CellRankTableViewCell.self)
        tableView.delegate = self
        tableView.dataSource = self
        title = App.TitleInNavigation.stats
    }

    // MARK: - Private methods
    private func loadDataCellOne() {
        SVProgressHUD.show()
        SVProgressHUD.setDefaultStyle(.light)
        viewModel.getDataCellOne { [weak self] result in
            guard let this = self else { return }
            switch result {
            case .success:
                this.updateUI()
                SVProgressHUD.dismiss()
            case .failure(let error):
                SVProgressHUD.dismiss()
                SVProgressHUD.setMinimumDismissTimeInterval(1)
                this.alert(error: error)
            }
        }
    }

    private func loadDataCellThree() {
        viewModel.getDataCellThree { [weak self] result in
            guard let this = self else { return }
            switch result {
            case .success:
                this.updateUI()
                SVProgressHUD.dismiss()
            case .failure(let error):
                SVProgressHUD.dismiss()
                SVProgressHUD.setMinimumDismissTimeInterval(1)
                this.alert(error: error)
            }
        }
    }

    private func loadDataCellRank() {
        viewModel.getDataCellRank { [weak self] result in
            guard let this = self else { return }
            switch result {
            case .success:
                this.updateUI()
                SVProgressHUD.dismiss()
            case .failure(let error):
                SVProgressHUD.dismiss()
                SVProgressHUD.setMinimumDismissTimeInterval(1)
                this.alert(error: error)
            }
        }
    }

    // MARK: - Public methods
    func updateUI() {
        DispatchQueue.main.async {
            self.tableView.reloadData()
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
            let cellOne = tableView.dequeueReusableCell(withClass: WorldStatsTableViewCell.self, for: indexPath)
            cellOne.viewModel = viewModel.viewModelForCellOne(at: indexPath)
            return cellOne
        case 1:
            let cellTwo = tableView.dequeueReusableCell(withClass: WorldChartTableViewCell.self, for: indexPath)
            cellTwo.viewModel = viewModel.viewModelForCellOne(at: indexPath)
            return cellTwo
        case 2:
            let cellThree = tableView.dequeueReusableCell(withClass: VNStatsTableViewCell.self, for: indexPath)
            cellThree.viewModel = viewModel.viewModelForCellThree(at: indexPath)
            return cellThree
        case 3:
            let cellFour = tableView.dequeueReusableCell(withClass: VNChartTableViewCell.self, for: indexPath)
            cellFour.viewModel = viewModel.viewModelForCellThree(at: indexPath)
            return cellFour
        case 4:
            let cellFive = tableView.dequeueReusableCell(withClass: StatsTableViewCell.self, for: indexPath)
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
