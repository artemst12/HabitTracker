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
        case oneStepHabit = 1
        case multiStepHabit = 2
    }

    private let tableView: UITableView
    private var sections: [TodaySectionType: [any TodayCalendarCellBuilder]] = [
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
    }

    func set(calendarItems: [any TodayCalendarCellBuilder]) {
        self.sections[.calendar] = calendarItems
    }

    func set(oneStepItems: [any TodayCalendarCellBuilder]) {
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
        guard
            let cell = tableView.dequeueReusableCell(
                withIdentifier: CalendarTableViewCell.reuseIdentifier
            ) as? CalendarTableViewCell
        else {
            return UITableViewCell()
        }

        let builder: (any TodayCalendarCellBuilder)?

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

        builder?.set(cell: cell)
        return builder?.build() ?? UITableViewCell()
    }
}
