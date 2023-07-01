//
//  WelcomePresenter.swift
//  HabitTracker
//
//  Created by Pavel Marinchenko on 25.06.2023.
//

import Foundation

final class WelcomePresenter {

    var interactor: WelcomeInteractorInput?
    var router: WelcomeRouterInput?

    weak var view: WelcomeViewInput?
}

// MARK: - WelcomeViewOutput
extension WelcomePresenter: WelcomeViewOutput {

    func nextButtonTapped() {
        router?.next(InformationConfigurator().configure())
    }
}

// MARK: - WelcomeInteractorOutput
extension WelcomePresenter: WelcomeInteractorOutput {

    func dataLoaded() {
        view?.changeStyle()
    }
}
