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
        vc.modalPresentationStyle = .fullScreen
        let navC = UINavigationController(rootViewController: vc)
        view?.navigationController?.present(navC, animated: true)
//        view?.navigationController?.pushViewController(vc, animated: true)
    }
}
