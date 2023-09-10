//
//  TodayConfigurator.swift
//  HabitTracker
//
//  Created by Артем Ступников on 04.09.2023.
//

import UIKit

protocol TodayConfiguratorProtocol: Assembly {
    
    func assembly() -> UIViewController
}

final class TodayConfigurator: TodayConfiguratorProtocol {
    
    func assembly() -> UIViewController {
        
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
        
        let homeView = createNavController(
            vc: view,
            itemName: "New habit",
            ItemImage: ""
        )
        
        return view
    }
}
