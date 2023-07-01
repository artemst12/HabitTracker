//
//  WelcomeRouter.swift
//  HabitTracker
//
//  Created by Pavel Marinchenko on 25.06.2023.
//

import UIKit

final class WelcomeRouter {

    weak var view: UIViewController?
}

// MARK: WelcomeRouterInput
extension WelcomeRouter: WelcomeRouterInput {

    func next(_ vc: UIViewController) {
        view?
            .navigationController?
            .pushViewController(vc, animated: true)
    }
}
