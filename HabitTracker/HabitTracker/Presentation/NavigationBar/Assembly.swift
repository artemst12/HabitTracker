//
//  Assembly.swift
//  HabitTracker
//
//  Created by Артем Ступников on 07.09.2023.
//

import UIKit

protocol Assembly {
    func assembly() -> UIViewController
}

extension Assembly {
    func createNavController(vc: UIViewController, itemName: String, ItemImage: String) -> UINavigationController {
        
        let item = UITabBarItem(title: itemName, image: UIImage(systemName: ItemImage)?.withAlignmentRectInsets(.init(top: 10, left: 0, bottom: 0, right: 0)), tag: 0)
        item.titlePositionAdjustment = .init(horizontal: 0, vertical: 10)
        
        let navController = UINavigationController(rootViewController: vc)
        navController.tabBarItem = item
        
        return navController
    }
}
