//
//  ViewController.swift
//  HabitTracker
//
//  Created by Артем Ступников on 22.06.2023.
//

import UIKit

final class FirstView: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .black
        setupUI()
    }
}

private extension FirstView {
    
    func setupUI() {
        setupView()
    }
    
    func setupView() {
        let descriptionLabel = CustomLabelDescription()
        descriptionLabel.text = "The neuroscience of happiness in your pocket!"
        view.addSubview(descriptionLabel)
        
        let titleLabel = CustomLabelTitle()
        titleLabel.text = "Health.Strong.Flexible. Be the best!"
        view.addSubview(titleLabel)
        
        let buttonNext = CustomButton()
        buttonNext.setTitle("Next", for: .normal)
        view.addSubview(buttonNext)
        
        NSLayoutConstraint.activate([
            titleLabel.bottomAnchor.constraint(equalTo: descriptionLabel.topAnchor, constant: -20),
            titleLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 25),
            titleLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -25),
            
            descriptionLabel.bottomAnchor.constraint(equalTo: buttonNext.topAnchor, constant: -80),
            descriptionLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 60),
            descriptionLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -60),
            descriptionLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            buttonNext.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -40),
            buttonNext.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 25),
            buttonNext.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -25),
            buttonNext.heightAnchor.constraint(equalToConstant: 55)
        ])
    }
}

