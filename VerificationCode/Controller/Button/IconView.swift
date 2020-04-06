//
//  IconView.swift
//  VerificationCode
//
//  Created by Christophe Hoste on 06.04.20.
//  Copyright © 2020 Christophe Hoste. All rights reserved.
//

import UIKit

class IconView: UIView {

    let image = UIImageView(initialImage: #imageLiteral(resourceName: "Image"), useContenMode: .scaleAspectFit)

    init(size: CGFloat = 55) {
        super.init(frame: .zero)

        backgroundColor = .white

        constrainWidth(constant: size)
        constrainHeight(constant: size)

        addSubview(image)
        image.fillSuperview(padding: .init(allInset: Constants.defaultPadding))
    }

    func animateArrow() {
        // swiftlint:disable line_length multiple_closures_with_trailing_closure
        UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 0.5, initialSpringVelocity: 0.5, options: .curveEaseOut, animations: {
            self.image.transform = CGAffineTransform(translationX: -10, y: 0 )
        }) { (_) in
            UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 0.5, initialSpringVelocity: 0.5, options: .curveEaseOut, animations: {
                self.image.transform = CGAffineTransform(translationX: 60, y: 0)
            }) { (_) in
                UIView.animate(withDuration: 0.5, delay: 2, usingSpringWithDamping: 0.5, initialSpringVelocity: 0.5, options: .curveEaseOut, animations: {
                    self.image.transform = .identity
                })
            }
        }
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
