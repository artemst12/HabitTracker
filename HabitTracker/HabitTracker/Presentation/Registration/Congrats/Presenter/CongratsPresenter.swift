//
//  CongratsPresenter.swift
//  HabitTracker
//
//  Created by Артем Ступников on 01.07.2023.
//

import UIKit

final class CongratsPresenter {
    
    var router: CongratsRouterInput?
    var interactor: CongratsInteractorInput?
    weak var view: CongratsViewInput?
}

// MARK: CongratsViewOutput
extension CongratsPresenter: CongratsViewOutput {
    
}

// MARK: CongratsInteractorOutput
extension CongratsPresenter: CongratsInteractorOutput  {
    
}
