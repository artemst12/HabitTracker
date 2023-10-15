//
//  CalendarItemTableCellBuilder.swift
//  HabitTracker
//
//  Created by Pavel Marinchenko on 01.10.2023.
//

import UIKit

final class CalendarItemTableCellBuilder: TodayCellBuilder {

    private weak var tableView: UITableView?

    private var model: CalendarTableViewCellModel?
    private var cell: UITableViewCell?

    func set(tableView: UITableView?) {
        self.tableView = tableView
    }

    func set(model: CalendarTableViewCellModel) {
        self.model = model
    }

    func build() -> UITableViewCell {
        guard let cell = self.tableView?.dequeueReusableCell(
            withIdentifier: CalendarTableViewCell.reuseIdentifier
        ) as? CalendarTableViewCell else {
            return UITableViewCell()
        }

        guard let model else {
            return UITableViewCell()
        }

        cell.configure(with: model)

        return cell
    }
}
