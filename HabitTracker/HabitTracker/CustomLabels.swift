//
//  CustomLabel.swift
//  HabitTracker
//
//  Created by Артем Ступников on 23.06.2023.
//

import UIKit

final class CustomLabelDescription: UILabel {
        
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.translatesAutoresizingMaskIntoConstraints = false
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

private extension CustomLabelDescription {
    
    func setupUI() {
        setupLabel()
    }
    
    func setupLabel() {
        self.textColor = .lightGray
        self.font = .systemFont(ofSize: 14, weight: .medium)
        self.textAlignment = .center
        self.numberOfLines = 0
    }
}

final class CustomLabelTitle: UILabel {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.translatesAutoresizingMaskIntoConstraints = false
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

private extension CustomLabelTitle {
    
    func setupUI() {
        setupLabel()
    }
    
    func setupLabel() {
        self.textColor = .white
        self.font = .systemFont(ofSize: 32, weight: .bold)
        self.textAlignment = .center
        self.numberOfLines = 0
    }
}
