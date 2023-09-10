//
//  CustomTextFields.swift
//  HabitTracker
//
//  Created by Артем Ступников on 28.06.2023.
//

import UIKit

protocol DefaultValidator: UITextFieldDelegate {

    var currentState: TextFieldValidator.State { get }

}

final class CustomTextField: UITextField {

    override init(frame: CGRect) {
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

    private var validator: DefaultValidator?

    var isValid: Bool {
        validator?.currentState == .success
    }

    func set(delegate: DefaultValidator?) {
        self.validator = delegate
        self.delegate = delegate
    }
}

private extension CustomTextField {
    
    func setupUI() {
        setupTextField()
    }

    func setupTextField() {
        self.backgroundColor = Colors.lightBlack
        self.layer.cornerRadius = Constants.radiusTextField
        self.textColor = Colors.white
    }
}

extension CustomTextField {
    
    func setLeftPaddingPoints(_ amount: CGFloat) {
        let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: amount, height: self.frame.size.height))
        self.leftView = paddingView
        self.leftViewMode = .always
    }
    
    func setRightPaddingPoints(_ amount: CGFloat) {
        let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: amount, height: self.frame.size.height))
        self.rightView = paddingView
        self.rightViewMode = .always
    }
}
