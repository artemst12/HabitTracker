//
//  CongratsConfigurator.swift
//  HabitTracker
//
//  Created by Артем Ступников on 01.07.2023.
//

import UIKit

protocol CongratsConfiguratorProtocol {
    
    func configure() -> UIViewController
}

final class CongratsConfigurator {
    
    func configure() -> UIViewController {
        
        let interactor = CongratsInteractor()
        let presenter = CongratsPresenter()
        let router = CongratsRouter()
        let view = CongratsView()
        
        interactor.output = presenter
        router.view = view
        view.output = presenter
        
        presenter.interactor = interactor
        presenter.router = router
        presenter.view = view
        
        return view
    }
}

