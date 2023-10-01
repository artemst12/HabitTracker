//
//  TodayView.swift
//  HabitTracker
//
//  Created by Артем Ступников on 04.09.2023.
//

import UIKit

final class TodayView: UIViewController {
    
    var output: TodayViewOutput?
    
    private let tabBarView = CustomTabBar()
    
    private let todayTableView = UITableView()
    
    private var calendarCollectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
}

extension TodayView: TodayViewInput {
    
}

private extension TodayView {
    
    func setupUI() {
        setupTitle()
        setupTabBar()
        setupTableView()
        setupCalendarCollectionView()
        setupConstraints()
    }
    
    func setupTitle() {
        self.title = "Howdy, Nilou!"
        self.navigationController?.navigationBar.prefersLargeTitles = true
        self.navigationController?.navigationItem.largeTitleDisplayMode = .automatic
        self.navigationItem.hidesBackButton = true
    }
    
    func setupTabBar() {
        todayTableView.addSubview(tabBarView)
    }
    
    func setupTableView() {
        view.addSubview(todayTableView)
        todayTableView.translatesAutoresizingMaskIntoConstraints = false
        todayTableView.separatorStyle = .none
        todayTableView.rowHeight = UITableView.automaticDimension
        todayTableView.backgroundColor = Colors.background
    }
    
    func setupCalendarCollectionView() {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.estimatedItemSize = .init(width: 50, height: 100)
        layout.itemSize = .init(width: 50, height: 100)
        layout.minimumLineSpacing = 16
        layout.sectionInset = .init(top: 0, left: 25, bottom: 0, right: 25)

        calendarCollectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        calendarCollectionView.dataSource = self
        calendarCollectionView.delegate = self
        calendarCollectionView.backgroundColor = .clear
//        cardsCollectionView.isPagingEnabled = true

        calendarCollectionView.register(CalendarCollectionViewCell.self, forCellWithReuseIdentifier: "CalendarCollectionViewCell")

        todayTableView.addSubview(calendarCollectionView)
        calendarCollectionView.translatesAutoresizingMaskIntoConstraints = false
    }
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            
            todayTableView.topAnchor.constraint(equalTo: view.topAnchor),
            todayTableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            todayTableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            todayTableView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
    
            calendarCollectionView.topAnchor.constraint(equalTo: view.topAnchor, constant: 140),
            calendarCollectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),
            calendarCollectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30),
            calendarCollectionView.heightAnchor.constraint(equalToConstant: 100),
            
            tabBarView.heightAnchor.constraint(equalToConstant: 70),
            tabBarView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),
            tabBarView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30),
            tabBarView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -20),

        ])
    }
}
