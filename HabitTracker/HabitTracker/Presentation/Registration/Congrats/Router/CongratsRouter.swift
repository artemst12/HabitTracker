//
//  CongratsRouter.swift
//  HabitTracker
//
//  Created by Артем Ступников on 01.07.2023.
//

import UIKit

final class CongratsRouter {
    
    weak var view: UIViewController?
}

extension CongratsRouter: CongratsRouterInput {
    
    func next(_ vc: UIViewController) {
        view?.navigationController?.pushViewController(vc, animated: true)
    }
}
