//
//  InformationRouter.swift
//  HabitTracker
//
//  Created by Артем Ступников on 27.06.2023.
//

import UIKit

final class InformationRouter {
    
    weak var view: UIViewController?
}

extension InformationRouter: InformationRouterInput {
    
    func next(_ vc: UIViewController) {
        view?.navigationController?.pushViewController(vc, animated: true)
    }
}
