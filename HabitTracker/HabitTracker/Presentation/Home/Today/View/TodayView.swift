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
    private var todayTableAdapter: TodayTableViewAdapter?

    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        loadData()
    }

    func loadData() {
        output?.requestData()
    }
}

extension TodayView: MultiStepCollectionViewCellProtocol {
    func loadPlus(for id: UUID) {
        output?.plusCount(id: id)
    }
    
    func loadMinus(for id: UUID) {
        output?.minusCount(id: id)
    }
}

extension TodayView: TodayViewInput {
    
    func updateView(with model: TodayViewModel) {
        let calendarBuilder = CalendarItemTableCellBuilder()
        calendarBuilder.set(model: CalendarTableViewCellModel(items: model.calendarItems))
        todayTableAdapter?.set(calendarItems: [calendarBuilder])

        var oneStepBuilders: [any TodayCellBuilder] = []
        for habit in model.oneStepHabbitSection {
            let builder = OneStepItemTableCellBuilder()
            builder.set(model: habit)
            oneStepBuilders.append(builder)
        }

        todayTableAdapter?.set(oneStepItems: oneStepBuilders)
        
        let multiStepBuilder = MultiStepItemTableCellBuilder()
        multiStepBuilder.set(model: MultiStepTableViewCellModel(items: model.multiStepHabitSection))
        todayTableAdapter?.set(multiStepItems: [multiStepBuilder])
        multiStepBuilder.set(output: self)

        todayTableAdapter?.reload()
    }
}

private extension TodayView {
    
    func setupUI() {
        setupTitle()
        setupTableView()
        setupTabBar()
        setupConstraints()
    }
    
    func setupTitle() {
        self.title = "Howdy, Nilou!"
        self.navigationController?.navigationBar.prefersLargeTitles = true
        self.navigationController?.navigationItem.largeTitleDisplayMode = .automatic
        self.navigationItem.hidesBackButton = true
    }
    
    func setupTabBar() {
        view.addSubview(tabBarView)
        tabBarView.routeStatsActions = { [weak self] in
            self?.output?.statsButtonTapped()
        }
        tabBarView.routeNewHabitActions = { [weak self] in
            self?.output?.newHabitButtonTapped()
        }
    }
    
    func setupTableView() {
        view.addSubview(todayTableView)
        todayTableView.translatesAutoresizingMaskIntoConstraints = false
        todayTableView.separatorStyle = .none
        todayTableView.rowHeight = UITableView.automaticDimension
        todayTableView.backgroundColor = Colors.background

        self.todayTableAdapter = TodayTableViewAdapter(tableView: todayTableView)
    }
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            todayTableView.topAnchor.constraint(equalTo: view.topAnchor),
            todayTableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            todayTableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            todayTableView.bottomAnchor.constraint(equalTo: view.bottomAnchor),

            tabBarView.heightAnchor.constraint(equalToConstant: 70),
            tabBarView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),
            tabBarView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30),
            tabBarView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -20),
        ])
    }
}
