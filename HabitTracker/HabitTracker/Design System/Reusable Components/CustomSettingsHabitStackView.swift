//
//  CustomSettingsHabitStackView.swift
//  HabitTracker
//
//  Created by Артем Ступников on 15.11.2023.
//

import UIKit

final class CustomSettingsHabitStackView: UIView {
    
    weak var output: CreateHabitViewOutput?
    
    private var repeats: UIView!
    private var reminders: UIView!
    
    var routeRepeatsActions: (() -> Void)?
    var routeRemindersActions: (() -> Void)?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.translatesAutoresizingMaskIntoConstraints = false
        setupUI()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension CustomSettingsHabitStackView {
    
    func setupUI() {
        setupView()
        setupConstraints()
    }
    
    func createView(settingName: String, descriptionText: String, action: @escaping UIActionHandler) -> UIView {
        
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = Colors.forSettingsNewHabit
        view.layer.cornerRadius = 18
        
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.backgroundColor = .clear
        button.addAction(.init(handler: action), for: .touchUpInside)
        
        let settingLabel = UILabel()
        settingLabel.translatesAutoresizingMaskIntoConstraints = false
        settingLabel.font = .systemFont(ofSize: 22, weight: .regular)
        settingLabel.text = settingName
        
        let descriptionLabel = UILabel()
        descriptionLabel.translatesAutoresizingMaskIntoConstraints = false
        descriptionLabel.font = .systemFont(ofSize: 14, weight: .regular)
        descriptionLabel.text = descriptionText
        
        view.addSubview(button)
        view.addSubview(settingLabel)
        view.addSubview(descriptionLabel)
        
        NSLayoutConstraint.activate([
        
            view.heightAnchor.constraint(equalToConstant: 55),
            
            button.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            button.topAnchor.constraint(equalTo: view.topAnchor),
            button.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            button.bottomAnchor.constraint(equalTo: view.bottomAnchor),

            settingLabel.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            settingLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            
            descriptionLabel.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            descriptionLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -25),
            
            button.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            button.topAnchor.constraint(equalTo: view.topAnchor),
            button.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            button.bottomAnchor.constraint(equalTo: view.bottomAnchor),
        
        ])
        
        return view
    }
    
    func setupView() {
        
        repeats = createView(settingName: "Repeats", descriptionText: "1 time per day  >", action: { action in 
            self.routeRepeatsActions?() })
        reminders = createView(settingName: "Reminders", descriptionText: "On  >", action: { action in
            self.routeRemindersActions?() })
        
        let views: [UIView] = [repeats, reminders]
        
        views.forEach { view in
            addSubview(view)
        }
    }
    
    func setupConstraints() {
        
        NSLayoutConstraint.activate([
            
            repeats.topAnchor.constraint(equalTo: topAnchor),
            repeats.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            repeats.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
            
            reminders.topAnchor.constraint(equalTo: repeats.bottomAnchor, constant: 10),
            reminders.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            reminders.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
            
        ])
    }
}
