//
//  StatsView.swift
//  HabitTracker
//
//  Created by Артем Ступников on 24.09.2023.
//

import UIKit

final class StatsView: UIViewController {
    
    var output: StatsViewOutput?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
}

extension StatsView: StatsViewInput {
    
}

private extension StatsView {
    
    func setupUI() {
        
    }
}
