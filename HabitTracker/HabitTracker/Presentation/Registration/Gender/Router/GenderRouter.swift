//
//  GenderRouter.swift
//  HabitTracker
//
//  Created by Артем Ступников on 29.06.2023.
//

import UIKit

final class GenderRouter: GenderRouterInput {
    
    weak var view: UIViewController?
}

extension GenderRouter {
    
    func next(_ vc: UIViewController) {
        
        view?.navigationController?.pushViewController(vc, animated: true)
    }
}
