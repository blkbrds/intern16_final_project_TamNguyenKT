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
    private var cellIdentifier: String = "SearchCell"
    private var titleSearch: String = "Search"
    private var viewModel = SearchViewModel()
    private lazy var searchController = UISearchController(searchResultsController: nil)

    // MARK: - Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        loadData()
        configSearchController()
    }

    // MARK: - Override methods
    override func setUpUI() {
        let nib = UINib(nibName: "SearchTableViewCell", bundle: .main)
        tableView.register(nib, forCellReuseIdentifier: cellIdentifier)
        tableView.delegate = self
        tableView.dataSource = self
    }

    // MARK: - Private methods
    private func configSearchController() {
        title = titleSearch
        navigationItem.searchController = searchController
        searchController.obscuresBackgroundDuringPresentation = false
        searchController.searchResultsUpdater = self
    }

    private func loadData() {
        viewModel.getData() { result in
            switch result {
            case .success:
                DispatchQueue.main.async {
                    self.tableView.reloadData()
                }
            case .failure(let error):
                DispatchQueue.main.async {
                    self.alert(error: error)
                }
            }
        }
    }

   private func filterCountry(for searchText: String) {
            if searchText.isEmpty {
                viewModel.filter = viewModel.countries
            } else {
                viewModel.filter = viewModel.countries.filter { country in
                    return
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
        guard let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as? SearchTableViewCell else { return UITableViewCell() }
        cell.viewModel = viewModel.viewModelForCell(at: indexPath)
        return cell
    }
}

// MARK: - Extension UITableViewDelegate
extension SearchViewController: UITableViewDelegate {

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)

        let vc = DetailViewController()
        vc.title = viewModel.getNameCountry(at: indexPath)
        navigationController?.pushViewController(vc, animated: true)
    }
}

// MARK: - Extension UISearchResultUpdating
extension SearchViewController: UISearchResultsUpdating {

    func updateSearchResults(for searchController: UISearchController) {
        filterCountry(for: searchController.searchBar.text ?? "")
    }
}
