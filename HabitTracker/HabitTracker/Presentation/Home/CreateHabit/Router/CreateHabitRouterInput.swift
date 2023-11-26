//
//  CreateHabitRouterInput.swift
//  HabitTracker
//
//  Created by Артем Ступников on 14.11.2023.
//

import Foundation
import UIKit

protocol CreateHabitRouterInput {
    
    func next(_ vc: UIViewController)
    func dismiss()
    func showBottomSheet(_ vc: UIViewController)
}
