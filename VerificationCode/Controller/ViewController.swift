//
//  ViewController.swift
//  VerificationCode
//
//  Created by Christophe Hoste on 05.04.20.
//  Copyright © 2020 Christophe Hoste. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor(named: "backgroundAny")
        setupViews()
    }

    private func setupButton() -> UIButton {
        let button = ConfirmButton()
        button.addTarget(self, action: #selector(handleTap(_:)), for: .touchUpInside)
        return button
    }

    private func setupViews() {
        let veriView = VerificationView(numberOfDigits: 4)
        view.addSubview(veriView)
        veriView.anchor(top: view.safeAreaLayoutGuide.topAnchor,
                        leading: view.leadingAnchor,
                        bottom: nil,
                        trailing: view.trailingAnchor,
                        padding: .init(top: 100, left: 32, bottom: 16, right: 32))

        let confirmButton = setupButton()
        view.addSubview(confirmButton)
        confirmButton.anchor(top: veriView.bottomAnchor,
                      leading: view.leadingAnchor,
                      bottom: nil,
                      trailing: view.trailingAnchor,
                      padding: .init(allInset: 32))
    }

    @objc
    private func handleTap(_ sender: UIButton) {
        if let button = sender as? ConfirmButton {
            button.iconView.animateArrow()
            button.pulse()
        }
    }
}
