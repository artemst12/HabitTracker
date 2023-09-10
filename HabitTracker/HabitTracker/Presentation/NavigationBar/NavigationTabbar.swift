//
//  NavigationTabbar.swift
//  HabitTracker
//
//  Created by Артем Ступников on 07.09.2023.
//

import UIKit

final class NavigationTabbar: UITabBarController {
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTabbar()
    }
}

extension NavigationTabbar {
    func setupTabbar() {
        
        let assemblers: [Assembly] = [TodayConfigurator()]
        
        let tabBars = assemblers.map { $0.assembly() }
        
        viewControllers = tabBars
    }
}
