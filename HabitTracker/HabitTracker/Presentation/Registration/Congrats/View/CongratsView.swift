//
//  CongratsView.swift
//  HabitTracker
//
//  Created by Артем Ступников on 01.07.2023.
//

import UIKit

final class CongratsView: UIViewController {
    
    var output: CongratsViewOutput?
    
    private let historyScreens = StackScreenView()
    
    private let titleLabel = StyledLabel(
        font: .systemFont(ofSize: Fonts.titleSize, weight: Weigth.bold),
        color: Colors.white
    )
    
    private let descriptionLabel = StyledLabel(
        font: .systemFont(ofSize: Fonts.descriptionSize, weight: Weigth.medium),
        color: Colors.lightGray
    )
    
    private let buttonStart = CustomButton()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
}

//MARK: CongratsViewInput
extension CongratsView: CongratsViewInput {
    
}

// MARK: Private Methods
private extension CongratsView {
    
    func setupUI() {
        setupView()
        setupLabels()
        setupButtons()
        setupConstraints()
    }
    
    func setupView() {
        navigationItem.hidesBackButton = true
        view.backgroundColor = Colors.background
        
        view.addSubview(historyScreens)
        historyScreens.setScreenColor(welcomeColor: .white, informationColor: .white, genderColor: .white, congratsColor: .white)
    }
    
    func setupLabels() {
        view.addSubview(titleLabel)
        titleLabel.text = "Well done!".localized()
        
        view.addSubview(descriptionLabel)
        descriptionLabel.text = "You have been completed the 'Growth up' questionnaire: now we can personalise the data for you! :)".localized()
    }
    
    func setupButtons() {
        view.addSubview(buttonStart)
        buttonStart.setTitle("Let's start!".localized(), for: .normal)
        buttonStart.addAction(.init(handler: { [weak self] action in
            self?.output?.nextButtonTapped()
        }), for: .touchUpInside)
    }
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            
            historyScreens.topAnchor.constraint(equalTo: view.topAnchor, constant: 70),
            historyScreens.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),
            historyScreens.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30),
            
            titleLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 150),
            titleLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            titleLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),
            titleLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30),
            
            descriptionLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 20),
            descriptionLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            descriptionLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 40),
            descriptionLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -40),
            
            buttonStart.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -40),
            buttonStart.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 25),
            buttonStart.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -25),
            buttonStart.heightAnchor.constraint(equalToConstant: 55)
        ])
    }
}
