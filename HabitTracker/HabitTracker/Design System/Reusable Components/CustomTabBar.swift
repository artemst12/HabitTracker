//
//  CustomTabBar.swift
//  HabitTracker
//
//  Created by Артем Ступников on 25.09.2023.
//

import UIKit

final class CustomTabBar: UIView {
    
    var output: TodayViewOutput?

    private var createNewHabitView: UIView!
    private var statsView: UIView!
    private var calendarView: UIView!
    
    private let createNewHabitButton = UIButton()
    private let statsButton = UIButton()
    private let calendarButton = UIButton()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.translatesAutoresizingMaskIntoConstraints = false
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension CustomTabBar {
    
    func setupUI() {
        setupTabBar()
        setupConstraints()
    }
    
    func createTabBarButtons(color: UIColor, imageName: String, action: @escaping UIActionHandler) -> UIView {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.layer.cornerRadius = 26
        view.backgroundColor = color
        
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.contentMode = .scaleAspectFit
        button.contentMode = .center
        button.setImage(UIImage(named: imageName), for: .normal)
        button.addAction(.init(handler: action), for: .touchUpInside)
        
        view.addSubview(button)
        
        NSLayoutConstraint.activate([
            button.topAnchor.constraint(equalTo: view.topAnchor),
            button.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            button.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            button.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
        
        return view
    }
    
    func setupTabBar() {
        translatesAutoresizingMaskIntoConstraints = false
        backgroundColor = Colors.blackForTabBar
        layer.cornerRadius = 36
        
        createNewHabitView = createTabBarButtons(color: Colors.blackForTabBar, imageName: "", action: { _ in })
        statsView = createTabBarButtons(color: Colors.blackForTabBar, imageName: "stats", action: { _ in self.output?.statsButtonTapped()})
        calendarView = createTabBarButtons(color: Colors.blackForTabBar, imageName: "", action: { _ in self.output?.calendarButtonTapped()})
        
        let tabBarButtons: [UIView] = [
            createNewHabitView,
            statsView,
            calendarView
        ]
        
        tabBarButtons.forEach { tabBarButton in
            addSubview(tabBarButton)
        }
    }
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
                        
            createNewHabitView.topAnchor.constraint(equalTo: topAnchor, constant: 10),
            createNewHabitView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10),
            createNewHabitView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -10),
            createNewHabitView.trailingAnchor.constraint(equalTo: statsView.leadingAnchor, constant: -10),
            
            statsView.trailingAnchor.constraint(equalTo: calendarView.leadingAnchor, constant: -10),
            statsView.topAnchor.constraint(equalTo: topAnchor, constant: 10),
            statsView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -10),
            statsView.widthAnchor.constraint(equalToConstant: 70),
            
            calendarView.topAnchor.constraint(equalTo: topAnchor, constant: 10),
            calendarView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10),
            calendarView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -10),
            calendarView.widthAnchor.constraint(equalToConstant: 70),

        ])
    }
}
