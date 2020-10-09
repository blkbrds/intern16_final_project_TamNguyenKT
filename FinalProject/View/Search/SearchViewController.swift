//
//  SearchViewController.swift
//  FinalProject
//
//  Created by PCI0001 on 9/14/20.
//  Copyright © 2020 Thinh Nguyen X. All rights reserved.
//

import UIKit

final class SearchViewController: ViewController {

    // MARK: - IBOulets
    @IBOutlet private weak var tableView: UITableView!

    // MARK: - Properties
    private var viewModel = SearchViewModel()
    private lazy var searchController = UISearchController(searchResultsController: nil)

    // MARK: - Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        loadData()
        configSearchController()
        observeData()
    }

    // MARK: - Override methods
    override func setUpUI() {
        super.setUpUI()
        tableView.register(nibWithCellClass: SearchTableViewCell.self)
        tableView.delegate = self
        tableView.dataSource = self
    }

    // MARK: - Private methods
    private func observeData() {
        viewModel.delegate = self
        viewModel.setupObserver()
    }
    private func configSearchController() {
        title = App.TitleInNavigation.search
        navigationItem.searchController = searchController
        searchController.obscuresBackgroundDuringPresentation = false
        searchController.searchResultsUpdater = self
    }

    private func loadData() {
        viewModel.getData { [weak self] result in
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

    private func filterCountry(for searchText: String) {
        if searchText.isEmpty {
            viewModel.filter = viewModel.countries
        } else {
            viewModel.filter = viewModel.countries.filter { country in
                country.countryName.lowercased().hasPrefix(searchText.lowercased())
            }
        }
        tableView.reloadData()
    }
}

// MARK: - Extension UITableViewDataSource
extension SearchViewController: UITableViewDataSource {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.numberOfRowInSection()
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withClass: SearchTableViewCell.self, for: indexPath)
        cell.delegate = self
        cell.viewModel = viewModel.viewModelForCell(at: indexPath)
        return cell
    }
}

// MARK: - Extension UITableViewDelegate
extension SearchViewController: UITableViewDelegate {

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 195
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)

        let vc = DetailViewController()
        vc.viewModel = viewModel.getNameCountry(at: indexPath)
        navigationController?.pushViewController(vc, animated: true)
    }
}

// MARK: - Extension UISearchResultUpdating
extension SearchViewController: UISearchResultsUpdating {

    func updateSearchResults(for searchController: UISearchController) {
        filterCountry(for: searchController.searchBar.text ?? "")
    }
}

// MARK: - Extension SearchViewModelDelegate
extension SearchViewController: SearchViewModelDelegate {

    func syncFollow(view: SearchViewModel, needPerform action: SearchViewModel.Action) {
        switch action {
        case .reloadData:
            tableView.reloadData()
        case .fail(let error):
            alert(error: error)
        }
    }
}

// MARK: - Extension SearchTableVieCellDelegate
extension SearchViewController: SearchTableViewCellDelegate {

    func view(view: SearchTableViewCell, needPerform action: SearchTableViewCell.Action) {
        guard let indexPath = tableView.indexPath(for: view) else { return }
        switch action {
        case .follow(isFollow: let isFollow):
            if isFollow {
                viewModel.unFollowItem(index: indexPath.row) { [weak self] result in
                    guard let this = self else { return }
                    switch result {
                    case .success:
                        this.tableView.reloadData()
                    case .failure(let error):
                        this.alert(error: error)
                    }
                }
            } else {
                viewModel.addFollowIntem(index: indexPath.row) { [weak self]result in
                    guard let this = self else { return }
                    switch result {
                    case .success:
                        this.tableView.reloadData()
                    case .failure(let error):
                        this.alert(error: error)
                    }
                }
            }
        }
    }
}
