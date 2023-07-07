//
//  WelcomeView.swift
//  HabitTracker
//
//  Created by Артем Ступников on 22.06.2023.
//

import UIKit

final class WelcomeView: UIViewController {

    var output: WelcomeViewOutput?

    private let titleLabel = StyledLabel(
        font: .systemFont(ofSize: Fonts.titleSize, weight: Weigth.bold),
        color: Colors.white
    )

    private let descriptionLabel = StyledLabel(
        font: .systemFont(ofSize: Fonts.descriptionSize, weight: Weigth.medium),
        color: Colors.lightGray
    )

    private let nextButton = CustomButton()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = Colors.background
        setupUI()
    }
}

// MARK: WelcomeViewInput
extension WelcomeView: WelcomeViewInput {

    func changeStyle() {
        // ...
    }
}

// MARK: Private methods
private extension WelcomeView {

    func setupUI() {
        setupView()
    }

    func setupView() {
        titleLabel.text = "Health.Strong.Flexible. Be the best!".localized()
        view.addSubview(titleLabel)
        
        descriptionLabel.text = "The neuroscience of happiness in your pocket!"
        view.addSubview(descriptionLabel)

        nextButton.setTitle("Next", for: .normal)
        nextButton.addAction(.init(handler: { [weak self] action in
            self?.output?.nextButtonTapped()
        }), for: .touchUpInside)

        view.addSubview(nextButton)

        NSLayoutConstraint.activate([
            titleLabel.bottomAnchor.constraint(equalTo: descriptionLabel.topAnchor, constant: -20),
            titleLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 25),
            titleLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -25),
            
            descriptionLabel.bottomAnchor.constraint(equalTo: nextButton.topAnchor, constant: -80),
            descriptionLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 60),
            descriptionLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -60),
            descriptionLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            nextButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -40),
            nextButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 25),
            nextButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -25),
            nextButton.heightAnchor.constraint(equalToConstant: 55)
        ])
    }
}

