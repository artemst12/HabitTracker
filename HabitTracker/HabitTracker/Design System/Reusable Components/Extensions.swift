//
//  Extensions.swift
//  HabitTracker
//
//  Created by Артем Ступников on 13.07.2023.
//

import UIKit

extension UIButton {
    func animateView(_ viewToAnimate: UIView) {
        UIView.animate(
            withDuration: 0.16,
            delay: 0,
            usingSpringWithDamping: 1,
            initialSpringVelocity: 0.5,
            options: .curveLinear,
            animations: {
                viewToAnimate.transform = CGAffineTransform(scaleX: 0.85, y: 0.85)
            }
        ) { (_) in
            UIView.animate(
                withDuration: 0.1,
                delay: 0,
                usingSpringWithDamping: 1,
                initialSpringVelocity: 2,
                options: .curveLinear,
                animations: {
                    viewToAnimate.transform = CGAffineTransform(scaleX: 1, y: 1)
                }, completion: nil
            )
        }
    }
}
