//
//  CalendarRouter.swift
//  HabitTracker
//
//  Created by Артем Ступников on 24.09.2023.
//

import UIKit

final class CalendarRouter {
    
    weak var view: UIViewController?
}

extension CalendarRouter {
    
    func next(_ vc: UIViewController) {
        view?.navigationController?.pushViewController(vc, animated: true)
    }
}
