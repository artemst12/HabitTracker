//
//  CustomButtons.swift
//  HabitTracker
//
//  Created by Артем Ступников on 24.06.2023.
//

import UIKit

final class CustomButton: UIButton {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.translatesAutoresizingMaskIntoConstraints = false
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

private extension CustomButton {
    
    func setupUI() {
        setupButton()
    }
    
    func setupButton() {
        self.setTitleColor(.black, for: .normal)
        self.titleLabel?.font = .systemFont(ofSize: 18, weight: .medium)
        self.backgroundColor = .init(red: 178/255, green: 240/255, blue: 66/255, alpha: 1)
        self.layer.cornerRadius = 14
    }
}
