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

extension TodayPresenter: TodayViewOutput {
    
    func statsButtonTapped() {
        router?.next(StatsConfigurator().configure())
    }
    
    func calendarButtonTapped() {
        router?.next(CalendarConfigurator().configure())
    }
}

extension TodayPresenter: TodayInteractorOutput {
    
}
