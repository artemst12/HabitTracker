//
//  TodayPresenter.swift
//  HabitTracker
//
//  Created by Артем Ступников on 04.09.2023.
//

import UIKit

final class TodayPresenter {
    
    var interactor: TodayInteractorInput?
    var router: TodayRouterInput?
    weak var view: TodayViewInput?
}

enum TodayInteractorMultistepAction {
    case minus
    case plus
}

extension TodayPresenter: TodayViewOutput {
    
    func newHabitButtonTapped() {
        router?.next(NewHabitConfigurator().configure())
    }
    
    func statsButtonTapped() {
        router?.next(StatsConfigurator().configure())
    }
    
    func calendarButtonTapped() {
        router?.next(CalendarConfigurator().configure())
    }

    func requestData() {
        interactor?.loadData()
    }
    
    func minusCount(id: UUID) {
        interactor?.changeData(id: id, type: .minus)
    }
}

extension TodayPresenter: TodayInteractorOutput {
    
    func dataLoaded(model: TodayViewModel) {
        view?.updateView(with: model)
    }
}
