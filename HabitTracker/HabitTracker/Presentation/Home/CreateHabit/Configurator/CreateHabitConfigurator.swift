//
//  CreateHabitConfigurator.swift
//  HabitTracker
//
//  Created by Артем Ступников on 14.11.2023.
//

import UIKit

protocol CreateHabitConfiguratorProtocol {
    
    func configure() -> UIViewController
}

final class CreateHabitConfigurator: CreateHabitConfiguratorProtocol {
    
    func configure() -> UIViewController {
        
        let view = CreateHabitView()
        let router = CreateHabitRouter()
        let presenter = CreateHabitPresenter()
        let interactor = CreateHabitInteractor()
        
        view.output = presenter
        router.view = view
        interactor.output = presenter
        
        presenter.view = view
        presenter.router = router
        presenter.interactor = interactor
        
        return view
    }
}
