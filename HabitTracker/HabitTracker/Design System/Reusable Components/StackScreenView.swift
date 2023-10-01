//
//  StackView.swift
//  HabitTracker
//
//  Created by Артем Ступников on 11.09.2023.
//

import UIKit

final class StackScreenView: UIView {
    
    private var welcomeScreen = UIView()
    private var informationScreen = UIView()
    private var genderScreen = UIView()
    private var congrats = UIView()

    private let stackView = UIStackView()

    override init(frame: CGRect) {
        super.init(frame: frame)
        self.translatesAutoresizingMaskIntoConstraints = false
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setScreenColor(welcomeColor: UIColor, informationColor: UIColor, genderColor: UIColor, congratsColor: UIColor) {
        welcomeScreen.backgroundColor = welcomeColor
        informationScreen.backgroundColor = informationColor
        genderScreen.backgroundColor = genderColor
        congrats.backgroundColor = congratsColor
    }
}

private extension StackScreenView {
    
    func setupUI() {
        configureStackView()
        configureViews()
        setupConstraints()
    }

    func configureStackView() {
        self.addSubview(stackView)
        stackView.axis = .horizontal
        stackView.spacing = 6
        stackView.distribution = .equalSpacing
    }

    func configureViews() {
        welcomeScreen = createViews(cornerRadius: Constants.cornerRadiusHistoryScreens)
        informationScreen = createViews(cornerRadius: Constants.cornerRadiusHistoryScreens)
        genderScreen = createViews(cornerRadius: Constants.cornerRadiusHistoryScreens)
        congrats = createViews(cornerRadius: Constants.cornerRadiusHistoryScreens)

        [ welcomeScreen, informationScreen, genderScreen, congrats ]
            .forEach { stackView.addArrangedSubview($0) }
    }

    func createViews(cornerRadius: CGFloat) -> UIView {
        let view = UIView()
        view.layer.cornerRadius = cornerRadius
        return view
    }
    
    func setupConstraints() {
        stackView.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: self.topAnchor),
            stackView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            stackView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            stackView.bottomAnchor.constraint(equalTo: self.bottomAnchor),

            welcomeScreen.widthAnchor.constraint(equalTo: self.widthAnchor, multiplier: 0.23),
            informationScreen.widthAnchor.constraint(equalTo: self.widthAnchor, multiplier: 0.23),
            genderScreen.widthAnchor.constraint(equalTo: self.widthAnchor, multiplier: 0.23),
            congrats.widthAnchor.constraint(equalTo: self.widthAnchor, multiplier: 0.23),

            heightAnchor.constraint(equalToConstant: 6)
        ])
    }
}
