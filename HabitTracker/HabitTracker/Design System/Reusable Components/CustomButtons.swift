//
//  CustomButtons.swift
//  HabitTracker
//
//  Created by Артем Ступников on 24.06.2023.
//

import UIKit

//MARK: - NextButtons
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

    // TODO: Смена стиля кнопки

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
        self.titleLabel?.font = .systemFont(ofSize: Fonts.buttonTitle, weight: .medium)
        self.backgroundColor = Colors.lightGreen
        self.layer.cornerRadius = Constants.cornerRadiusNextButton
        self.addTarget(self, action: #selector(animateClick(sender:)), for: .touchUpInside)
    }
    
    @objc func animateClick(sender: UIButton) {
        print("animate")
        self.animateView(sender)
    }
}

// MARK: - GenderButtons
final class CustomGenderButton: UIButton {
    
    private let emojiLabel = UILabel()
    private let genderLabel = UILabel()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.translatesAutoresizingMaskIntoConstraints = false
        emojiLabel.translatesAutoresizingMaskIntoConstraints = false
        genderLabel.translatesAutoresizingMaskIntoConstraints = false
        setupUI()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func configure(emojiText: String, genderText: String) {
        emojiLabel.text = emojiText
        genderLabel.text = genderText
    }
}

private extension CustomGenderButton {
    
    func setupUI() {
        setupButton()
        setupConstraints()
    }
    
    func setupButton() {
        self.addSubview(emojiLabel)
        emojiLabel.textColor = Colors.white
        emojiLabel.font = .systemFont(ofSize: Fonts.emojiSize)
        emojiLabel.textAlignment = .center

        self.addSubview(genderLabel)
        genderLabel.textColor = Colors.white
        genderLabel.font = .systemFont(ofSize: Fonts.buttonLabelSize, weight: Weigth.bold)
        genderLabel.textAlignment = .center

        self.backgroundColor = Colors.disable
        self.layer.cornerRadius = Constants.cornerRadiusGenderButton
        
        self.addTarget(self, action: #selector(animateClick(sender:)), for: .touchUpInside)
    }
    
    @objc func animateClick(sender: UIButton) {
        print("animate")
        self.animateView(sender)
    }
        
    func setupConstraints() {
//        emojiLabel.setContentHuggingPriority(.defaultHigh, for: .horizontal)
//        genderLabel.setContentHuggingPriority(.defaultHigh, for: .horizontal)

        NSLayoutConstraint.activate([
            emojiLabel.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            emojiLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: 15),

            genderLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 12),
            genderLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -12),
            genderLabel.topAnchor.constraint(equalTo: emojiLabel.bottomAnchor, constant: 15),
            genderLabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -12)
        ])
    }
}
