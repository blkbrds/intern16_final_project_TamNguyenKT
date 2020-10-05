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
    private var refreshControl = UIRefreshControl()
    var viewModel: StatsViewModel = StatsViewModel() {
        didSet {
            updateView()
        }
    }

    // MARK: - Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        configRefreshControl()
        title = App.TitleInNavigation.stats
    }

    override func setUpData() {
        super.setUpData()
        handleCallApi()
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
    private func configRefreshControl() {
      if #available(iOS 10.0, *) {
        tableView.refreshControl = refreshControl
      } else {
        tableView.addSubview(refreshControl)
      }
      refreshControl.tintColor = #colorLiteral(red: 0.7248262763, green: 0.2954983413, blue: 0.2409256697, alpha: 1)
      refreshControl.addTarget(self, action: #selector(refreshData(_:)), for: .valueChanged)
    }

    private func handleCallApi() {
        HUD.show()
        let dispatchGroup = DispatchGroup()

        /// getDataCellOne
        dispatchGroup.enter()
        viewModel.getDataCellOne { [weak self] result in
            dispatchGroup.leave()
            guard let this = self else { return }
            switch result {
            case .success: break
            case .failure(let error):
                this.alert(error: error)
            }
        }

        /// getDataCellThree
        dispatchGroup.enter()
        viewModel.getDataCellThree { [weak self] result in
            dispatchGroup.leave()
            guard let this = self else { return }
            switch result {
            case .success: break
            case .failure(let error):
                this.alert(error: error)
            }
        }

        /// getDataCellRank
        dispatchGroup.enter()
        viewModel.getDataCellRank { [weak self] result in
            dispatchGroup.leave()
            guard let this = self else { return }
            switch result {
            case .success: break
            case .failure(let error):
                this.alert(error: error)
            }
        }

        dispatchGroup.notify(queue: .main) {
            HUD.popActivity()
            self.tableView.reloadData()
        }
    }

    private func updateView() {
        guard isViewLoaded else { return }
        tableView.reloadData()
    }

    @objc private func refreshData(_ sender: Any) {
      handleCallApi()
      refreshControl.endRefreshing()
      let activityIndicatorView = UIActivityIndicatorView()
      activityIndicatorView.stopAnimating()
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
        case 5 ... 15:
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
            return CGFloat(RowType.statsWorld.size)
        case 1:
            return CGFloat(RowType.chartWorld.size)
        case 2:
            return CGFloat(RowType.statsVN.size)
        case 3:
            return CGFloat(RowType.chartVN.size)
        case 4:
            return CGFloat(RowType.rank.size)
        default:
            return 200
        }
    }
}
