//
//  StatsPresenter.swift
//  HabitTracker
//
//  Created by Артем Ступников on 24.09.2023.
//

import UIKit

final class StatsPresenter {
    
    weak var view: StatsViewInput?
    var router: StatsRouterInput?
    var interactor: StatsInteractorInput?
}

extension StatsPresenter: StatsViewOutput {
    
}

extension StatsPresenter: StatsInteractorOutput {
    
}

