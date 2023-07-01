//
//  CustomButtons.swift
//  HabitTracker
//
//  Created by Артем Ступников on 24.06.2023.
//

import UIKit

final class CustomButton: UIButton {

    enum Style {
        case enabled
        case disabled
    }

    override init(frame: CGRect) {
        super.init(frame: frame)
        self.translatesAutoresizingMaskIntoConstraints = false
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func change(state: Style) {
        switch state {
        case .enabled:
            self.isEnabled = true
        case .disabled:
            self.isEnabled = false
        }
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

// MARK: - GenderButtons
final class CustomGenderButton: UIButton {
    
    private let emojiLabel = UILabel()
    private let genderLabel = UILabel()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.translatesAutoresizingMaskIntoConstraints = false
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

private extension CustomGenderButton {
    
    func setupUI() {
        setupButton()
        setupConstraints()
    }
    
    func setupButton() {
        self.addSubview(emojiLabel)
        emojiLabel.textColor = .white
        emojiLabel.font = .systemFont(ofSize: 32)
        
        self.addSubview(genderLabel)
        genderLabel.textColor = .white
        genderLabel.font = .systemFont(ofSize: 18, weight: .bold)
        
        self.backgroundColor = .init(red: 25/255, green: 25/255, blue: 25/255, alpha: 1)
        self.layer.cornerRadius = 16
    }
        
    func setupConstraints() {
        NSLayoutConstraint.activate([
            self.heightAnchor.constraint(equalToConstant: 170),
            self.widthAnchor.constraint(equalToConstant: 160),
            
            emojiLabel.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            emojiLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: 15),
            
            genderLabel.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            genderLabel.topAnchor.constraint(equalTo: emojiLabel.bottomAnchor, constant: 15)
        ])
    }
    
    func configure(emojiText: String, genderText: String) {
        emojiLabel.text = emojiText
        genderLabel.text = genderText
    }
}
