//
//  TodayTableViewAdapter.swift
//  HabitTracker
//
//  Created by Артем Ступников on 19.09.2023.
//

import UIKit

final class TodayTableViewAdapter: NSObject {

    enum TodaySectionType: Int, Hashable, CaseIterable {
        case calendar = 0
        case multiStepHabit = 1
        case oneStepHabit = 2
    }

    private let tableView: UITableView
    private var sections: [TodaySectionType: [any TodayCellBuilder]] = [
        .calendar: [],
        .multiStepHabit: [],
        .oneStepHabit: []
    ]

    init(tableView: UITableView) {
        self.tableView = tableView
        super.init()
        self.tableView.dataSource = self
        self.tableView.delegate = self
        // self.tableView.contentOffset = .init(x: 200, y: 1000)
        self.tableView.contentInset = .init(top: 0, left: 0, bottom: 80, right: 0)

        self.tableView.register(
            CalendarTableViewCell.self,
            forCellReuseIdentifier: CalendarTableViewCell.reuseIdentifier
        )
        self.tableView.register(
            OneStepTableViewCell.self,
            forCellReuseIdentifier: OneStepTableViewCell.reuseIdentifier
        )
        self.tableView.register(
            MultiStepTableViewCell.self,
            forCellReuseIdentifier: MultiStepTableViewCell.reuseIdentifier
        )
    }

    func set(calendarItems: [any TodayCellBuilder]) {
        self.sections[.calendar] = calendarItems
    }
    
    func set(multiStepItems: [any TodayCellBuilder]) {
        self.sections[.multiStepHabit] = multiStepItems
    }

    func set(oneStepItems: [any TodayCellBuilder]) {
        self.sections[.oneStepHabit] = oneStepItems
    }

    func reload() {
        tableView.reloadData()
    }
}

extension TodayTableViewAdapter: UITableViewDataSource, UITableViewDelegate {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        guard let type = TodaySectionType(rawValue: section) else {
            return 0
        }

        return self.sections[type]?.count ?? 0
    }

    func numberOfSections(in tableView: UITableView) -> Int {
        return TodaySectionType.allCases.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let builder: (any TodayCellBuilder)?

        if let type = TodaySectionType(rawValue: indexPath.section) {
            builder = self.sections[type]?[indexPath.row]
        } else {
            builder = nil
        }

        builder?.set(tableView: tableView)
        return builder?.build() ?? UITableViewCell()
    }
    
//    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
//        guard let type = TodaySectionType(rawValue: section) else {
//            return nil
//        }
//
//        switch type {
//        case .calendar:
//            return nil
//
//        case .multiStepHabit:
//            return "Daily Check-in"
//
//        case .oneStepHabit:
//
//            var totalHabits = 0
//            var completedHabits = 0
//
//            if let habits = self.sections[.oneStepHabit] {
//                totalHabits = habits.count
//
//                for habit in habits {
//                    if habit.isSelected {
//                        completedHabits += 1
//                    }
//                }
//            }
//
//            return "Today [\(completedHabits)/\(totalHabits)]"
//        }
//    }
//
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        guard let type = TodaySectionType(rawValue: section) else {
            return nil
        }
        
        let headerView: UIView?

        switch type {
        case .calendar:
            headerView = nil
        case .multiStepHabit:
            let view = UIView()
            let label = UILabel()
            let countView = UIView()
            let countLabel = UILabel()
            
            label.text = "Daily Check-in"
            label.font = .systemFont(ofSize: Fonts.header, weight: .bold)
            
            countView.backgroundColor = Colors.forHeaderView
            countView.layer.cornerRadius = 6
            
            var totalHabits = 0
            var completedHabits = 0

            if let habits = self.sections[.multiStepHabit] {
                totalHabits = habits.count

                for habit in habits {
                    if habit.isSelected {
                        completedHabits += 1
                    }
                }
            }
            
            countLabel.text = "\(completedHabits)/\(totalHabits)"
            countLabel.font = .systemFont(ofSize: 14, weight: .regular)

            view.addSubview(label)
            view.addSubview(countView)
            countView.addSubview(countLabel)
            
            label.translatesAutoresizingMaskIntoConstraints = false
            countView.translatesAutoresizingMaskIntoConstraints = false
            countLabel.translatesAutoresizingMaskIntoConstraints = false
            
            NSLayoutConstraint.activate([
                label.topAnchor.constraint(equalTo: view.topAnchor, constant: 0),
                label.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 8),
                label.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 0),
                
                countView.topAnchor.constraint(equalTo: view.topAnchor, constant: 2),
                countView.leadingAnchor.constraint(equalTo: label.trailingAnchor, constant: 6),
                countView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -2),
                countView.heightAnchor.constraint(equalToConstant: 30),
                countView.widthAnchor.constraint(equalToConstant: 45),
                
                countLabel.centerXAnchor.constraint(equalTo: countView.centerXAnchor),
                countLabel.centerYAnchor.constraint(equalTo: countView.centerYAnchor),
            ])

            headerView = view
            
        case .oneStepHabit:
            let view = UIView()
            let label = UILabel()
            let countView = UIView()
            let countLabel = UILabel()
            
            var totalHabits = 0
            var completedHabits = 0

            if let habits = self.sections[.oneStepHabit] {
                totalHabits = habits.count

                for habit in habits {
                    if habit.isSelected {
                        completedHabits += 1
                    }
                }
            }
            
            label.text = "Today"
            label.font = .systemFont(ofSize: Fonts.header, weight: .bold)
            
            countView.backgroundColor = Colors.forHeaderView
            countView.layer.cornerRadius = 6
            
            countLabel.text = "\(completedHabits)/\(totalHabits)"
            countLabel.font = .systemFont(ofSize: 14, weight: .regular)
            
            view.addSubview(countView)
            countView.addSubview(countLabel)
            view.addSubview(label)
            label.translatesAutoresizingMaskIntoConstraints = false
            countView.translatesAutoresizingMaskIntoConstraints = false
            countLabel.translatesAutoresizingMaskIntoConstraints = false
            
            NSLayoutConstraint.activate([
                label.topAnchor.constraint(equalTo: view.topAnchor, constant: 0),
                label.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 8),
                label.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -8),
                
                countView.topAnchor.constraint(equalTo: view.topAnchor, constant: 2),
                countView.leadingAnchor.constraint(equalTo: label.trailingAnchor, constant: 6),
                countView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -2),
                countView.heightAnchor.constraint(equalToConstant: 30),
                countView.widthAnchor.constraint(equalToConstant: 45),
                
                countLabel.centerXAnchor.constraint(equalTo: countView.centerXAnchor),
                countLabel.centerYAnchor.constraint(equalTo: countView.centerYAnchor),
            ])
            

            headerView = view
        }

        return headerView
    }
}
