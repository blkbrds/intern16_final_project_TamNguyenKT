//
//  ViewController.swift
//  MyApp
//
//  Created by iOSTeam on 2/21/18.
//  Copyright © 2018 Asian Tech Co., Ltd. All rights reserved.
//

import UIKit
import MVVM
class ViewController: UIViewController, MVVM.View {

  // MARK: - Life cycle
  override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
    super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
  }

  required init?(coder aDecoder: NSCoder) {
    super.init(coder: aDecoder)
  }

  override func viewWillAppear(_ animated: Bool) {
    super.viewWillAppear(animated)
  }

  override func viewDidLoad() {
    super.viewDidLoad()
    setUpData()
    setUpUI()
  }

  // MARK: - Public functions
  func setUpData() { }

  func setUpUI() {
    configNavi()
  }

  // MARK: - Private functions
  private func configNavi() {
    navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor(cgColor: #colorLiteral(red: 0.262745098, green: 0.6352941176, blue: 0.7058823529, alpha: 1))]
    navigationController?.navigationBar.backgroundColor = #colorLiteral(red: 0.9529411765, green: 0.9568627451, blue: 0.9921568627, alpha: 1)
    navigationController?.navigationBar.tintColor = #colorLiteral(red: 0.262745098, green: 0.6352941176, blue: 0.7058823529, alpha: 1)
  }
}
