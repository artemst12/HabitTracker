//
//  TodayView.swift
//  HabitTracker
//
//  Created by Артем Ступников on 04.09.2023.
//

import UIKit

final class TodayView: UIViewController {
    
    var output: TodayViewOutput?
    
    private let scrollView = UIScrollView()
    private let contentView = UIView()
    
    private let titleLabel = UILabel()
    
    private let tabBarView = UIView()
    private let createNewHabitView = UIView()
    private let statsView = UIView()
    private let calendarView = UIView()
    
    private let createNewHabitButton = UIButton()
    private let statsButton = UIButton()
    private let calendarButton = UIButton()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
}

extension TodayView: TodayViewInput {
    
}

private extension TodayView {
    
    func setupUI() {
        setupScrollView()
        setupLabels()
        setupTabBarView()
        setupConstraints()
    }
    
    func setupScrollView() {
        view.addSubview(scrollView)
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        scrollView.keyboardDismissMode = .onDrag
        scrollView.alwaysBounceVertical = true
//        scrollView.backgroundColor = .blue

        scrollView.addSubview(contentView)
        contentView.backgroundColor = .black
        contentView.translatesAutoresizingMaskIntoConstraints = false
    }
    
    func setupLabels() {
        contentView.addSubview(titleLabel)
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.text = "Howdy, Nilou!"
        titleLabel.font = .systemFont(ofSize: Fonts.titleSize, weight: .bold)
        titleLabel.textColor = .white
    }
    
    func createTabBarButtons(color: UIColor, imageName: String) -> UIView {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.layer.cornerRadius = 36
        view.backgroundColor = color
        
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.contentMode = .scaleAspectFit
        button.contentMode = .center
        button.setImage(UIImage(named: imageName), for: .normal)
        
        view.addSubview(button)
        
        NSLayoutConstraint.activate([
            button.topAnchor.constraint(equalTo: view.topAnchor),
            button.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            button.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            button.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
        
        return view
    }
    
    func setupTabBarView() {
        contentView.addSubview(tabBarView)
        tabBarView.translatesAutoresizingMaskIntoConstraints = false
        tabBarView.backgroundColor = Colors.lightBlack
        tabBarView.layer.cornerRadius = 36
        
        tabBarView.addSubview(createNewHabitView)
        createNewHabitView.translatesAutoresizingMaskIntoConstraints = false
        createNewHabitView.layer.cornerRadius = 24
        createNewHabitView.backgroundColor = .lightGray
        
        tabBarView.addSubview(statsView)
        statsView.translatesAutoresizingMaskIntoConstraints = false
        statsView.backgroundColor = .lightGray
        
        tabBarView.addSubview(calendarView)
        calendarView.translatesAutoresizingMaskIntoConstraints = false
        calendarView.backgroundColor = .lightGray
    }
    
    func setupTabBarButtons() {
        createNewHabitView.addSubview(createNewHabitButton)
        createNewHabitButton.translatesAutoresizingMaskIntoConstraints = false
        createNewHabitButton.contentMode = .scaleAspectFit
        createNewHabitButton.contentMode = .center
        createNewHabitButton.setImage(UIImage(named: ""), for: .normal)
        
        statsView.addSubview(statsButton)
        statsButton.translatesAutoresizingMaskIntoConstraints = false
        statsButton.contentMode = .scaleAspectFit
        statsButton.contentMode = .center
        statsButton.setImage(UIImage(named: ""), for: .normal)
        
        calendarView.addSubview(calendarButton)
        calendarButton.translatesAutoresizingMaskIntoConstraints = false
        calendarButton.contentMode = .scaleAspectFit
        calendarButton.contentMode = .center
        calendarButton.setImage(UIImage(named: ""), for: .normal)
        
    }
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            scrollView.topAnchor.constraint(equalTo: view.topAnchor),
            scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            
            contentView.topAnchor.constraint(equalTo: view.topAnchor),
            contentView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            contentView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            contentView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            
            titleLabel.topAnchor.constraint(equalTo: scrollView.topAnchor),
            titleLabel.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor, constant: 30),
            
            tabBarView.heightAnchor.constraint(equalToConstant: 70),
            tabBarView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 30),
            tabBarView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -30),
            tabBarView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -20),
            
            createNewHabitView.topAnchor.constraint(equalTo: tabBarView.topAnchor, constant: 10),
            createNewHabitView.leadingAnchor.constraint(equalTo: tabBarView.leadingAnchor, constant: 10),
            createNewHabitView.bottomAnchor.constraint(equalTo: tabBarView.bottomAnchor, constant: -10),
            createNewHabitView.trailingAnchor.constraint(equalTo: statsView.leadingAnchor, constant: -10),
            
            statsView.centerXAnchor.constraint(equalTo: tabBarView.centerXAnchor),
            statsView.topAnchor.constraint(equalTo: tabBarView.topAnchor, constant: 10),
            statsView.bottomAnchor.constraint(equalTo: tabBarView.bottomAnchor, constant: -10),
            statsView.widthAnchor.constraint(equalToConstant: 50),
            
            calendarView.topAnchor.constraint(equalTo: tabBarView.topAnchor, constant: 10),
            calendarView.leadingAnchor.constraint(equalTo: statsView.trailingAnchor, constant: 40),
            calendarView.bottomAnchor.constraint(equalTo: tabBarView.bottomAnchor, constant: -10),
            calendarView.widthAnchor.constraint(equalToConstant: 50),

        ])
    }
}
