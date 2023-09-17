//
//  TodayConfigurator.swift
//  HabitTracker
//
//  Created by Артем Ступников on 04.09.2023.
//

import UIKit

protocol TodayConfiguratorProtocol {
    
    func configure() -> UIViewController
}

final class TodayConfigurator: TodayConfiguratorProtocol {
    
    func configure() -> UIViewController {
        
        let interactor = TodayInteractor()
        let presenter = TodayPresenter()
        let router = TodayRouter()
        let view = TodayView()
        
        interactor.output = presenter
        router.view = view
        view.output = presenter
        
        presenter.interactor = interactor
        presenter.router = router
        presenter.view = view
        
        return view
    }
}
