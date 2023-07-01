//
//  GenderConfigurator.swift
//  HabitTracker
//
//  Created by Артем Ступников on 29.06.2023.
//

import UIKit

protocol GenderConfiguratorProtocol {
    
    func configure() -> UIViewController
}

final class GenderConfigurator: GenderConfiguratorProtocol {
    
    func configure() -> UIViewController {
        
        let router = GenderRouter()
        let interactor = GenderInteractor()
        let presenter = GenderPresenter()
        let view = GenderView()
        
        interactor.output = presenter 
        router.view = view
        view.output = presenter
        
        presenter.router = router
        presenter.interactor = interactor
        presenter.view = view
        
        return view
    }
}


