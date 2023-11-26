//
//  CreateHabitPresenter.swift
//  HabitTracker
//
//  Created by Артем Ступников on 14.11.2023.
//

import UIKit

final class CreateHabitPresenter {
    
    weak var view: CreateHabitView?
    var router: CreateHabitRouter?
    var interactor: CreateHabitInteractor?
}

extension CreateHabitPresenter: CreateHabitViewOutput {    
    
    func backButtonTapped() {
        router?.dismiss()
    }
    
    func createNewButtonTapped() {
        router?.next(TodayConfigurator().configure())
    }
    
    func repeatsTapped() {
        router?.showRepeatsBottomSheet(RepeatsBottomSheet())
//        router?.showBottomSheet(TodayConfigurator().configure())
    }
    
    func remindersTapped() {
        router?.showRemindersBottomSheet(RemindersBottomSheet())
    }
}

extension CreateHabitPresenter: CreateHabitInteractorOutput {
    
}
