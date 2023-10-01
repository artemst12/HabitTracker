//
//  CalendarPresenter.swift
//  HabitTracker
//
//  Created by Артем Ступников on 24.09.2023.
//

import UIKit

final class CalendarPresenter {
    
    weak var view: CalendarView?
    var router: CalendarRouter?
    var interactor: CalendarInteractor?
}

extension CalendarPresenter: CalendarViewOutput {
    
}

extension CalendarPresenter: CalendarInteractorOutput {
    
}
