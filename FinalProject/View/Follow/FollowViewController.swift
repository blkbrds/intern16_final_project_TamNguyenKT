//
//  FollowViewController.swift
//  FinalProject
//
//  Created by PCI0001 on 9/15/20.
//  Copyright © 2020 Thinh Nguyen X. All rights reserved.
//

import UIKit

final class FollowViewController: ViewController {

    // MARK: - IBOUlets
    @IBOutlet private weak var tableView: UITableView!

    // MARK: - Properties
    var viewModel = FollowViewModel()

    // MARK: - Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        fetchRealmData()
        setUpNavigation()
        viewModel.delegate = self
        viewModel.setupObserve()

    }
    // MARK: - Override methods
    override func setUpUI() {
        tableView.register(nibWithCellClass: FollowCell.self)
        tableView.delegate = self
        tableView.dataSource = self
    }

    private func setUpNavigation() {
        let deleteAll = UIBarButtonItem(image: #imageLiteral(resourceName: "ic_favorite_trash.png"),
                                        style: .plain,
                                        target: self,
                                        action: #selector(deleteAllFavoriteButtonTouchUpInside))
        navigationController?.navigationBar.tintColor = #colorLiteral(red: 0.05882352941, green: 0.1058823529, blue: 0.2156862745, alpha: 1)
        navigationItem.title = "Follow"
        navigationItem.rightBarButtonItem = deleteAll
    }

    private func fetchRealmData() {
        viewModel.fetchRealmData { [weak self] (result) in
            guard let this = self else { return }
            switch result {
            case .success:
                this.tableView.reloadData()
            case.failure(let error):
                this.alert(error: error)
            }
        }
    }

    @objc private func deleteAllFavoriteButtonTouchUpInside() {
        let alert = UIAlertController(title: App.TitleAlert.title, message: App.TitleAlert.message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: App.TitleAlert.confirm, style: .default, handler: { (result) in
            self.viewModel.deleteAllItem { [weak self] (result) in
                guard let this = self else { return }
                switch result {
                case.success:
                    this.fetchRealmData()
                case.failure(let error):
                    this.alert(error: error)
                }
            }
        }))
        alert.addAction(UIAlertAction(title: "No", style: .cancel, handler: nil))
        self.present(alert, animated: true)
    }
}

// MARK: - Extension UITableViewDataSource
extension FollowViewController: UITableViewDataSource {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.numberOfRowInSection()
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withClass: FollowCell.self, for: indexPath)
        cell.viewModel = viewModel.viewModelForFollowCell(at: indexPath)
        cell.delegate = self
        return cell
    }
}

// MARK: - Extension UITableViewDelegate
extension FollowViewController: UITableViewDelegate {

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 250
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vc = DetailViewController()
        vc.viewModel = viewModel.getCountryInFollow(at: indexPath)
        navigationController?.pushViewController(vc, animated: true)
    }
}

// MARK: - Extension FollowCellDelegate
extension FollowViewController: FollowCellDelegate {

    func view(view: FollowCell, needPerforms action: FollowCell.Action) {
        switch action {
        case .delete:
            viewModel.deleteItemFollow(countryCode: view.viewModel?.countryCode ?? "") { [weak self] (result) in
                guard let this = self else { return }
                switch result {
                case.success:
                    this.fetchRealmData()
                case .failure(let error):
                    this.alert(error: error)
                }
            }
        }
    }
}

extension FollowViewController: FollowViewModelDelegate {

    func syncFollow(viewModel: FollowViewModel, needperformAction action: FollowViewModel.Action) {
        switch action {
        case .reloadData:
            fetchRealmData()
        case .fail(let error):
            alert(error: error)
        }
    }
}
