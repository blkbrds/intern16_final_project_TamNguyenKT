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
    private var cellIdentifier: String = "DetailCell"
    var viewModel: DetailViewModel = DetailViewModel()

    // MARK: - Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        title = viewModel.title
    }

    // MARK: - Override methods
    override func setUpUI() {
        let nib = UINib(nibName: "DetailTableViewCell", bundle: .main)
        tableView.register(nib, forCellReuseIdentifier: cellIdentifier)
        tableView.delegate = self
        tableView.dataSource = self
    }

    // MARK: - Private methods
}

// MARK: - Extension UITableViewDataSource
extension DetailViewController: UITableViewDataSource {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as? DetailTableViewCell else { return UITableViewCell() }
        //cell.viewModel = viewModel.
    }
}

// MARK: - Extension UITableViewDelegate
extension DetailViewController: UITableViewDelegate {

}
