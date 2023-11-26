//
//  CreateHabitRouter.swift
//  HabitTracker
//
//  Created by Артем Ступников on 14.11.2023.
//

import UIKit

final class CreateHabitRouter {
    
    weak var view: UIViewController?
}

extension CreateHabitRouter {
    
    func next(_ vc: UIViewController) {
        view?.navigationController?.pushViewController(vc, animated: true)
    }

    func dismiss() {
        view?.dismiss(animated: true)
    }
    
    func showRepeatsBottomSheet(_ vc: UIViewController) {
//        view?.navigationController?.pushViewController(vc, animated: true)

        if let sheet = vc.sheetPresentationController {
            sheet.detents = [.medium()]
        }
        view?.navigationController?.present(vc, animated: true)
    }
    
    func showRemindersBottomSheet(_ vc: UIViewController) {
//        view?.navigationController?.pushViewController(vc, animated: true)

        if let sheet = vc.sheetPresentationController {
            sheet.detents = [.large()]
        }
        view?.navigationController?.present(vc, animated: true)
    }
}
