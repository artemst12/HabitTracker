//
//  InformationPresenter.swift
//  HabitTracker
//
//  Created by Артем Ступников on 27.06.2023.
//

import UIKit

final class InformationPresenter {
    
    var interactor: InformationInteractorInput?
    var router: InformationRouterInput?
    weak var view: InformationViewInput?
}

// MARK: - InformationViewOutput
extension InformationPresenter: InformationViewOutput {
    
    func nextButtonTapped() {
        router?.next(GenderConfigurator().configure())
    }
}

// MARK: - InformationInteractorOutput
extension InformationPresenter: InformationInteractorOutput {
    
}
