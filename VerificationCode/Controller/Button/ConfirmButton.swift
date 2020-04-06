//
//  ConfirmButton.swift
//  VerificationCode
//
//  Created by Christophe Hoste on 05.04.20.
//  Copyright © 2020 Christophe Hoste. All rights reserved.
//

import UIKit

class ConfirmButton: UIButton {

    let iconView = IconView()

    init() {
        super.init(frame: .zero)
        setupButton()
        setupStackView()
    }

    private func setupButton() {
        backgroundColor = .alphaWhite
        layer.cornerRadius = Constants.cornerRadius
        clipsToBounds = true
    }

    private func setupStackView() {
        let stackView = UIStackView(arrangedSubviews: [UILabel(initialText: "Confirm",
                                                               useFont: .systemFont(ofSize: 16,
                                                                                    weight: .bold)), iconView])
        stackView.isUserInteractionEnabled = false

        addSubview(stackView)
        stackView.fillSuperview(padding: .init(top: 0, left: 20, bottom: 0, right: 0))
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
