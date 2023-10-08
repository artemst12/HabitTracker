//
//  CalendarItemTableCellBuilder.swift
//  HabitTracker
//
//  Created by Pavel Marinchenko on 01.10.2023.
//

import UIKit

protocol TodayCalendarCellBuilder {

    associatedtype ViewModel

    func set(model: ViewModel)
    func set(cell: UITableViewCell)
    func build() -> UITableViewCell
}

final class CalendarItemTableCellBuilder: TodayCalendarCellBuilder {

    private var model: CalendarTableViewCellModel?
    private var cell: UITableViewCell?

    func set(model: CalendarTableViewCellModel) {
        self.model = model
    }

    func set(cell: UITableViewCell) {
        self.cell = cell
    }

    func build() -> UITableViewCell {
        guard let model, let cell = self.cell as? CalendarTableViewCell else {
            return UITableViewCell()
        }

        cell.configure(with: model)

        return cell
    }
}
