//
//  NewHabitPresenter.swift
//  HabitTracker
//
//  Created by Артем Ступников on 03.11.2023.
//

import UIKit

final class NewHabitPresenter {
    
    weak var view: NewHabitView?
    var router: NewHabitRouter?
    var interactor: NewHabitInteractor?
}

extension NewHabitPresenter: NewHabitViewOutput {
    
}

extension NewHabitPresenter: NewHabitInteractorOutput {
    
    func getItems() -> [NewHabitStruct] {
        interactor?.loadData() ?? []
    }
    
    func updateView(_ data: [NewHabitStruct]) {
        view?.updateView(data: data)
    }
    
    func backButtonTapped() {
        router?.next(TodayConfigurator().configure())
    }
}
