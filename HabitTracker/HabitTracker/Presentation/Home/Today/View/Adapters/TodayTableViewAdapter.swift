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
        TodaySectionType.allCases.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let builder: (any TodayCellBuilder)?

        switch indexPath.section {
        case 0:
            builder = self.sections[.calendar]?[indexPath.row]
        case 1:
            builder = self.sections[.multiStepHabit]?[indexPath.row]
        case 2:
            builder = self.sections[.oneStepHabit]?[indexPath.row]
        default:
            builder = nil
        }

        builder?.set(tableView: tableView)
        return builder?.build() ?? UITableViewCell()
    }
}
