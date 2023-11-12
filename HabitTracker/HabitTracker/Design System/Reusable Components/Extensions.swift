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

//extension UIViewController {
//    
//    func configureNavigationBar(largeTitleColor: UIColor, backgoundColor: UIColor, tintColor: UIColor, title: String, preferredLargeTitle: Bool) {
//        if #available(iOS 13.0, *) {
//            let navBarAppearance = UINavigationBarAppearance()
//            navBarAppearance.configureWithOpaqueBackground()
//            navBarAppearance.largeTitleTextAttributes = [.foregroundColor: largeTitleColor]
//            navBarAppearance.titleTextAttributes = [.foregroundColor: largeTitleColor]
//            navBarAppearance.backgroundColor = backgoundColor
//
//            navigationController?.navigationBar.standardAppearance = navBarAppearance
//            navigationController?.navigationBar.compactAppearance = navBarAppearance
//            navigationController?.navigationBar.scrollEdgeAppearance = navBarAppearance
//
//            navigationController?.navigationBar.prefersLargeTitles = preferredLargeTitle
//            navigationController?.navigationBar.isTranslucent = false
//            navigationController?.navigationBar.tintColor = tintColor
//            navigationItem.title = title
//
//        } else {
//            // Fallback on earlier versions
//            navigationController?.navigationBar.barTintColor = backgoundColor
//            navigationController?.navigationBar.tintColor = tintColor
//            navigationController?.navigationBar.isTranslucent = false
//            navigationItem.title = title
//        }
//}}
