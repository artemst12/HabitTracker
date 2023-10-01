//
//  StatsConfigurator.swift
//  HabitTracker
//
//  Created by Артем Ступников on 24.09.2023.
//

import UIKit

protocol StatsConfiguratorProtocol {
    
    func configure() -> UIViewController
}

final class StatsConfigurator: StatsConfiguratorProtocol {
    
    func configure() -> UIViewController {
        
        let view = StatsView()
        let router = StatsRouter()
        let presenter = StatsPresenter()
        let interactor = StatsInteractor()
        
        view.output = presenter
        router.view = view
        interactor.output = presenter
        
        presenter.view = view
        presenter.router = router
        presenter.interactor = interactor
        
        return view
    }
}
