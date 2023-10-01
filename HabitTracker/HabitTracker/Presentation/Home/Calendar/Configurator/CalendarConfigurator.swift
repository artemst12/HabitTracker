//
//  CalendarConfigurator.swift
//  HabitTracker
//
//  Created by Артем Ступников on 24.09.2023.
//

import UIKit

protocol CalendarConfiguratorProtocol {
    
    func configure() -> UIViewController
}

final class CalendarConfigurator: CalendarConfiguratorProtocol {
    
    func configure() -> UIViewController {
        
        let view = CalendarView()
        let router = CalendarRouter()
        let presenter = CalendarPresenter()
        let interactor = CalendarInteractor()
        
        view.output = presenter
        router.view = view
        interactor.output = presenter
        
        presenter.view = view
        presenter.router = router
        presenter.interactor = interactor
        
        return view
    }
}
