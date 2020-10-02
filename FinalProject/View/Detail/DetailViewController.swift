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
        loadDataInDetail()
    }

    // MARK: - Override methods
    override func setUpUI() {
        tableView.register(nibWithCellClass: CellOneTableViewCell.self)
        tableView.register(nibWithCellClass: DetailTableViewCell.self)
        tableView.register(nibWithCellClass: CellThreeTableViewCell.self)
        tableView.register(nibWithCellClass: CellFourTableViewCell.self)
        tableView.delegate = self
        tableView.dataSource = self
        title = viewModel.title
    }

    // MARK: - Private methods
    private func loadDataInDetail() {
        viewModel.getDataInDetail { [weak self] result in
            guard let this = self else { return }
            switch result {
            case .success:
                this.updateUI()
            case .failure(let error):
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
extension DetailViewController: UITableViewDataSource {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.numberOfRowInSection()
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch indexPath.row {
        case 0:
            let cellOne = tableView.dequeueReusableCell(withClass: CellOneTableViewCell.self, for: indexPath)
            cellOne.viewModel = viewModel.viewModelForCellOne(at: indexPath)
            return cellOne
        case 1:
            let cellTwo = tableView.dequeueReusableCell(withClass: DetailTableViewCell.self, for: indexPath)
            cellTwo.viewModel = viewModel.viewModelForCirceChart(at: indexPath)
            return cellTwo
        case 2:
            let cellThree = tableView.dequeueReusableCell(withClass: CellThreeTableViewCell.self, for: indexPath)
            cellThree.viewModel = viewModel.viewModelForConfirmedChart(at: indexPath)
            return cellThree
        case 3:
            let cellFour = tableView.dequeueReusableCell(withClass: CellFourTableViewCell.self, for: indexPath)
            cellFour.viewModel = viewModel.viewModelForDeadthChart(at: indexPath)
            return cellFour
        default:
            return UITableViewCell()
        }
    }
}

// MARK: - Extension UITableViewDelegate
extension DetailViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        switch indexPath.row {
        case 0:
            return 190
        case 1:
            return 160
        case 2:
            return 300
        case 3:
            return 300
        default:
            return UITableView.automaticDimension
        }
    }
}
