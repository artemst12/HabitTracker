//
//  NewHabitRouter.swift
//  HabitTracker
//
//  Created by Артем Ступников on 03.11.2023.
//

import UIKit

final class NewHabitRouter {
    
    weak var view: UIViewController?
}

extension NewHabitRouter {
    
    func next(_ vc: UIViewController) {
        view?.navigationController?.pushViewController(vc, animated: true)
    }
}
