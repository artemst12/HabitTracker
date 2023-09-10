//
//  TodayRouter.swift
//  HabitTracker
//
//  Created by Артем Ступников on 04.09.2023.
//

import UIKit

final class TodayRouter: TodayRouterInput {
    
    weak var view: UIViewController?
}

extension TodayRouter {
    
    func next(_ vc: UIViewController) {
        view?.navigationController?.pushViewController(vc, animated: true)
    }
}
