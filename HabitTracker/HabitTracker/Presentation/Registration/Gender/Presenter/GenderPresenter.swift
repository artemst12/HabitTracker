//
//  GenderPresenter.swift
//  HabitTracker
//
//  Created by Артем Ступников on 29.06.2023.
//

import UIKit

final class GenderPresenter {
    
    var router: GenderRouterInput?
    var interactor: GenderInteractorInput?
    weak var view: GenderViewInput?
}

extension GenderPresenter: GenderViewOutput {
    
    func nextButtonTapped() {
        router?.next(CongratsConfigurator().configure())
    }
    
    func getItems() {
        interactor?.loadData()
    }
}

extension GenderPresenter: GenderInteractorOutput {

    func itemsLoaded(_ items: [EmojiItems]) {
        view?.updateButtons(items)
    }
}
