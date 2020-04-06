//
//  VerificationTextFieldDelegate.swift
//  VerificationCode
//
//  Created by Christophe Hoste on 05.04.20.
//  Copyright © 2020 Christophe Hoste. All rights reserved.
//

import UIKit

protocol VerificationTextFieldDelegate: class {
    func nextTextField(_ textField: UITextField)
    func deleteBackward(_ textField: UITextField)
}
