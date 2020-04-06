//
//  VerificationView.swift
//  VerificationCode
//
//  Created by Christophe Hoste on 05.04.20.
//  Copyright © 2020 Christophe Hoste. All rights reserved.
//

import UIKit

class VerificationView: UIView {

    var numberOfDigits: Int!
    var textFields: [UITextField] = []

    init(numberOfDigits: Int = 4) {
        self.numberOfDigits = numberOfDigits
        super.init(frame: .zero)

        layer.cornerRadius = Constants.cornerRadius
        layer.borderWidth = 2
        layer.borderColor = UIColor.white.cgColor

        let stackView = UIStackView(arrangedSubviews: createVerificationTextFields(digits: numberOfDigits))
        stackView.spacing = 8
        stackView.distribution = .fillEqually

        addSubview(stackView)
        stackView.fillSuperview(padding: .init(allInset: 20))
    }

    @discardableResult
    private func createVerificationTextFields(digits: Int) -> [UITextField] {
        for index in 0..<digits {
            let textField = VerificationTextField(initialText: "-")
            textField.tag = index
            textField.veriDelegate = self
            textFields.append(textField)
        }
        return textFields
    }

    private func getCode() -> String {
        var code = ""
        for textField in textFields {
            code.append(textField.text ?? "")
        }

        return code
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension VerificationView: VerificationTextFieldDelegate {

    func nextTextField(_ textField: UITextField) {
        if textField.tag < numberOfDigits - 1 {
            textFields[textField.tag + 1].becomeFirstResponder()
        } else {
            textField.resignFirstResponder()
            debugPrint(getCode())
        }
    }

    func deleteBackward(_ textField: UITextField) {
        if let digit = textField.text, !(digit.isEmpty) {
            return
        }
        textField.text = "-"
        if textField.tag > 0 {
            textFields[textField.tag - 1].becomeFirstResponder()
        } else {
            textField.resignFirstResponder()
        }
    }
}
