//
//  GenderView.swift
//  HabitTracker
//
//  Created by Артем Ступников on 28.06.2023.
//

import UIKit

final class GenderView: UIViewController {
    
    var output: GenderViewOutput?
    
    private let titleLabel = StyledLabel(
        font: .systemFont(ofSize: 32, weight: .bold),
        color: .white
    )
    
    private let descriptionLabel = StyledLabel(
        font: .systemFont(ofSize: 14, weight: .medium),
        color: .lightGray
    )
    
    private let maleButton = CustomGenderButton()
    private let femaleButton = CustomGenderButton()
    
    private let data: [EmojiItems] = []
    
    private let nextButton = CustomButton()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
}

// MARK: GenderViewInput
extension GenderView: GenderViewInput {
}

private extension GenderView {
    
    func setupUI() {
        setupView()
        setupLabels()
        setupButtons()
        setupConstrains()
    }
    
    func setupView() {
        view.backgroundColor = .black
    }
    
    func setupLabels() {
        view.addSubview(titleLabel)
        titleLabel.text = "What's your gender?"
        
        view.addSubview(descriptionLabel)
        descriptionLabel.text = "To make sure we recommended the right settings for you. :)"
    }
    
    func setupButtons() {
        view.addSubview(nextButton)
        nextButton.setTitle("Next", for: .normal)
        nextButton.addAction(.init(handler: { [weak self] action in
            self?.output?.nextButtonTapped()
        }), for: .touchUpInside)
        
        view.addSubview(maleButton)
        
        view.addSubview(femaleButton)
    }
    
    func setupConstrains() {
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 160),
            titleLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            titleLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),
            titleLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30),
            
            descriptionLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 20),
            descriptionLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            descriptionLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 40),
            descriptionLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -40),
            
            maleButton.topAnchor.constraint(equalTo: descriptionLabel.bottomAnchor, constant: 20),
            maleButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 25),
            maleButton.trailingAnchor.constraint(equalTo: femaleButton.leadingAnchor, constant: -20),
            
            femaleButton.topAnchor.constraint(equalTo: descriptionLabel.bottomAnchor, constant: 20),
            femaleButton.leadingAnchor.constraint(equalTo: maleButton.trailingAnchor, constant: 20),
//            femaleButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -25),
            
            nextButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -40),
            nextButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 25),
            nextButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -25),
            nextButton.heightAnchor.constraint(equalToConstant: 55)
        ])
    }
}
