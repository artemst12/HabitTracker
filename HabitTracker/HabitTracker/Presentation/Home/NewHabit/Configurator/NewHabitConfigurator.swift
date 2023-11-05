//
//  NewHabitConfigurator.swift
//  HabitTracker
//
//  Created by Артем Ступников on 03.11.2023.
//

import UIKit

protocol NewHabitConfiguratorProtocol {
    
    func configure() -> UIViewController
}

final class NewHabitConfigurator: NewHabitConfiguratorProtocol {
    
    func configure() -> UIViewController {
        
        let view = NewHabitView()
        let router = NewHabitRouter()
        let presenter = NewHabitPresenter()
        let interactor = NewHabitInteractor()
        
        view.output = presenter
        router.view = view
        interactor.output = presenter
        
        presenter.view = view
        presenter.router = router
        presenter.interactor = interactor
        
        return view
    }
}
