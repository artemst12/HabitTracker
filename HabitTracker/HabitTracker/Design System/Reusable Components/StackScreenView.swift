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
        views()
        setupConstraints()
    }
    
    func createViews(cornerRadius: CGFloat) -> UIView {
        let view = UIView()
        self.addSubview(view)
        view.translatesAutoresizingMaskIntoConstraints = false
        view.layer.cornerRadius = cornerRadius
        
        return view
    }
    
    func views() {
        welcomeScreen = createViews(cornerRadius: Constants.cornerRadiusHistoryScreens)
        informationScreen = createViews(cornerRadius: Constants.cornerRadiusHistoryScreens)
        genderScreen = createViews(cornerRadius: Constants.cornerRadiusHistoryScreens)
        congrats = createViews(cornerRadius: Constants.cornerRadiusHistoryScreens)
    }
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
        welcomeScreen.heightAnchor.constraint(equalToConstant: 6),
        welcomeScreen.widthAnchor.constraint(equalToConstant: 80),
        welcomeScreen.leadingAnchor.constraint(equalTo: self.leadingAnchor),
        
        informationScreen.heightAnchor.constraint(equalToConstant: 6),
        informationScreen.widthAnchor.constraint(equalToConstant: 80),
        informationScreen.leadingAnchor.constraint(equalTo: welcomeScreen.trailingAnchor, constant: 6),
        
        genderScreen.heightAnchor.constraint(equalToConstant: 6),
        genderScreen.widthAnchor.constraint(equalToConstant: 80),
        genderScreen.leadingAnchor.constraint(equalTo: informationScreen.trailingAnchor, constant: 6),
        
        congrats.heightAnchor.constraint(equalToConstant: 6),
        congrats.widthAnchor.constraint(equalToConstant: 80),
        congrats.leadingAnchor.constraint(equalTo: genderScreen.trailingAnchor, constant: 6),
        ])
    }
}
