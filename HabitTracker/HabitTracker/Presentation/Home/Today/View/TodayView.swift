//
//  TodayView.swift
//  HabitTracker
//
//  Created by Артем Ступников on 04.09.2023.
//

import UIKit

final class TodayView: UIViewController {
    
    var output: TodayViewOutput?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
}

extension TodayView: TodayViewInput {
    
}

private extension TodayView {
    
    func setupUI() {
        
    }
}
