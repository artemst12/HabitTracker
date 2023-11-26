//
//  RepeatsBottomSheet.swift
//  HabitTracker
//
//  Created by Артем Ступников on 25.11.2023.
//

import UIKit

final class RepeatsBottomSheet: UIViewController {
        
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
}

extension RepeatsBottomSheet {
    func setupUI() {
        setupView()
    }
    
    func setupView() {
        view.backgroundColor = Colors.background
        
        self.title = "Repeats"
    }
}
