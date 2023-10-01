//
//  StatsRouter.swift
//  HabitTracker
//
//  Created by Артем Ступников on 24.09.2023.
//

import UIKit

final class StatsRouter {
    
    weak var view: UIViewController?
}

extension StatsRouter: StatsRouterInput {
    
    func next(_ vc: UIViewController) {
        view?.navigationController?.pushViewController(vc, animated: true)
    }
}
