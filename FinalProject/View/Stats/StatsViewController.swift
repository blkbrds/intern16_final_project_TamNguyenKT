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

    // MARK: - Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    // MARK: - Override methods
    override func setUpUI() {
        tableView.delegate = self
        tableView.dataSource = self
    }
}

// MARK: - Extension UITableViewDataSource
extension StatsViewController: UITableViewDataSource {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        <#code#>
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        <#code#>
    }
}

// MARK: - Extension UITableViewDelegate
extension StatsViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
}
