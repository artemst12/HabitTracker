//
//  InformationConfigurator.swift
//  HabitTracker
//
//  Created by Артем Ступников on 27.06.2023.
//

import UIKit

protocol InformationConfiguratorProtocol {
    
    func configure() -> UIViewController
}

final class InformationConfigurator: InformationConfiguratorProtocol {
    
    func configure() -> UIViewController {
        
        let router = InformationRouter()
        let interactor = InformationInteractor()
        let presenter = InformationPresenter()
        let view = InformationView()
        
        interactor.output = presenter
        router.view = view
        view.output = presenter
        
        presenter.interactor = interactor
        presenter.router = router
        presenter.view = view
        
        return view
    }
}

