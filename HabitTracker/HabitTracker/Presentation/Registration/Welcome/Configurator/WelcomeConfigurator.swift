//
//  WelcomeConfigurator.swift
//  HabitTracker
//
//  Created by Pavel Marinchenko on 25.06.2023.
//

import UIKit

protocol WelcomeConfiguratorProtocol {

    func configure() -> UIViewController
}

final class WelcomeConfigurator: WelcomeConfiguratorProtocol {

    func configure() -> UIViewController {

        let router = WelcomeRouter()
        let view = WelcomeView()
        let presenter = WelcomePresenter()
        let interactor = WelcomeInteractor()

        interactor.output = presenter
        router.view = view
        view.output = presenter

        presenter.interactor = interactor
        presenter.router = router
        presenter.view = view

        return view
    }
}
