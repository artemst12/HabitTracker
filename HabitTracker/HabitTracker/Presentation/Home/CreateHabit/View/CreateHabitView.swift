//
//  CreateHabitView.swift
//  HabitTracker
//
//  Created by Артем Ступников on 14.11.2023.
//

import UIKit

final class CreateHabitView: UIViewController {
    
    var output: CreateHabitViewOutput?
    
    private var stackView = CustomPersonalHabitStackView()
    private var stackSettingsView = CustomSettingsHabitStackView()
    
    private var textField = UITextField()
    
    private var createNewButton = CustomButton()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
}

private extension CreateHabitView {
    
    func setupUI() {
        setupView()
        setupTextField()
        setupPersonalHabitStackView()
        setupButton()
        setupConstraints()
    }
    
    func setupView() {
        view.backgroundColor = Colors.background
        
        let backTitledButton = BackTitledButton(
            title: "Create personal habit",
            type: .crosshair) { [weak self] in
                self?.output?.backButtonTapped()
            }

        self.navigationItem.hidesBackButton = true
        self.navigationItem.leftBarButtonItem = .init(customView: backTitledButton)
    }
    
    func setupTextField() {
        textField.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(textField)
        textField.backgroundColor = .clear
        textField.textAlignment = .left
        textField.font = .systemFont(ofSize: 24)
        textField.textColor = .lightGray
        textField.placeholder = "Extra details..."
    }
    
    func setupButton() {
        view.addSubview(createNewButton)
        createNewButton.setTitle("Create new".localized(), for: .normal)
        createNewButton.addAction(.init(handler: { [weak self] action in
            self?.output?.createNewButtonTapped()
        }), for: .touchUpInside)
        createNewButton.isEnabled = true
        createNewButton.backgroundColor = Colors.disable
        createNewButton.setTitleColor(.white, for: .normal)
    }
    
    func setupPersonalHabitStackView() {
        
        view.addSubview(stackView)
        view.addSubview(stackSettingsView) 
        
        stackSettingsView.routeRepeatsActions = { [weak self] in
            self?.output?.repeatsTapped()
        }
        
        stackSettingsView.routeRemindersActions = { [weak self] in
            self?.output?.remindersTapped()
        }
    }
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            
            stackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 25),
            stackView.heightAnchor.constraint(equalToConstant: 50),
            stackView.topAnchor.constraint(equalTo: view.topAnchor, constant: 120),
            stackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -25),
            
            textField.topAnchor.constraint(equalTo: stackView.bottomAnchor, constant: 0),
            textField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 25),
            textField.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            textField.heightAnchor.constraint(equalToConstant: 200),
            
            stackSettingsView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            stackSettingsView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            stackSettingsView.bottomAnchor.constraint(equalTo: createNewButton.topAnchor, constant: -60),
            stackSettingsView.heightAnchor.constraint(equalToConstant: 120),
            
            createNewButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -40),
            createNewButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 25),
            createNewButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -25),
            createNewButton.heightAnchor.constraint(equalToConstant: 55)
        
        ])
    }
}
