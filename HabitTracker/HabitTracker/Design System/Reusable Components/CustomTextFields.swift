//
//  CustomTextFields.swift
//  HabitTracker
//
//  Created by Артем Ступников on 28.06.2023.
//

import UIKit

final class CustomTextField: UITextField {
    
    override init(frame: CGRect){
        super.init(frame: frame)
        self.translatesAutoresizingMaskIntoConstraints = false
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    convenience init(icon: UIImage) {
        self.init(frame: .zero)
        self.set(icon: icon)
    }
    
    func set(icon: UIImage) {
        self.leftView = UIImageView(image: icon)
    }
}

private extension CustomTextField {
    
    func setupUI() {
        setupTextField()
    }
    
    func setupTextField() {
        self.backgroundColor = .init(red: 25/255, green: 25/255, blue: 25/255, alpha: 1)
        self.layer.cornerRadius = 12
        self.textColor = .white
    }
}
