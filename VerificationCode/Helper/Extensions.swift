//
//  LabelExtension.swift
//  VerificationCode
//
//  Created by Christophe Hoste on 06.04.20.
//  Copyright © 2020 Christophe Hoste. All rights reserved.
//

import UIKit

extension UIColor {
    static var backgroundAny: UIColor {
        return UIColor(named: "backgroundAny") ?? .white
    }

    static var alphaWhite: UIColor {
        return UIColor.white.withAlphaComponent(0.3)
    }
}

extension UILabel {
    convenience init(initialText: String, useFont: UIFont) {
        self.init()
        textColor = .white
        text = initialText
        font = useFont
    }
}

extension UIButton {
    func pulse() {
        let pulse = CASpringAnimation(keyPath: "transform.scale")
        pulse.duration = 0.15
        pulse.fromValue = 0.99
        pulse.toValue = 1.0
        layer.add(pulse, forKey: "pulse")
    }
}

extension UIImageView {
    convenience init(initialImage: UIImage, useContenMode: UIView.ContentMode) {
        self.init()
        image = #imageLiteral(resourceName: "Image")
        contentMode = .scaleAspectFit
    }
}

extension UIEdgeInsets {
    init(allInset: CGFloat) {
        self.init(top: allInset, left: allInset, bottom: allInset, right: allInset)
    }
}
