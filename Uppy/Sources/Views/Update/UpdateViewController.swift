//
//  UpdateViewController.swift
//  Uppy
//
//  Created by Arpit Williams on 05/07/20.
//  Copyright © 2020 Everli. All rights reserved.
//

import Foundation
import UIKit

class UpdateViewController: UIViewController {

  var updatePresenter: UpdatePresenter?

  // MARK: - Outlets

  @IBOutlet private var forceUpdateLabel: UILabel!
  @IBOutlet private var forceUpdateButton: UIButton!

  // MARK: - View Methods

  override func viewDidLoad() {
    setupView()
    updatePresenter?.output = self
    updatePresenter?.viewDidLoad()
  }

  private func setupView() {
    title = Strings.uppy

    forceUpdateLabel.font = UIFont.systemFont(ofSize: 18, weight: .medium)
    forceUpdateLabel.textColor = UIColor.Violet.Camerlot
    forceUpdateLabel.textAlignment = .center

    forceUpdateButton.layer.borderWidth = 2
    forceUpdateButton.layer.borderColor = UIColor.Violet.Camerlot.cgColor

    forceUpdateButton.setTitleColor(UIColor.Violet.Camerlot, for: .normal)
    forceUpdateButton.setTitle(Strings.update, for: .normal)
    forceUpdateButton.addTarget(self, action: #selector(forcedUpdateButtonTapped), for: .touchUpInside)
  }

  // MARK: - Button Action

  @objc private func forcedUpdateButtonTapped() {
    updatePresenter?.didTappedUpdateButton()
  }
}

// MARK: - Update presenter output

extension UpdateViewController: UpdatePresenterOutput {

  func setForceUpdateMessage(_ message: String) {
    forceUpdateLabel.text = message
  }
}
