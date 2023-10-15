//
//  OneStepItemTableCellBuilder.swift
//  HabitTracker
//
//  Created by Артем Ступников on 04.10.2023.
//

import UIKit

final class OneStepItemTableCellBuilder: TodayCellBuilder {

    private weak var tableView: UITableView?
    private var model: OneStepTableViewCellModel?
    private var cell: UITableViewCell?

    func set(tableView: UITableView?) {
        self.tableView = tableView
    }

    func set(model: OneStepTableViewCellModel) {
        self.model = model
    }

    func build() -> UITableViewCell {
        guard let cell = self.tableView?.dequeueReusableCell(
            withIdentifier: OneStepTableViewCell.reuseIdentifier
        ) as? OneStepTableViewCell else {
            return UITableViewCell()
        }

        guard let model else {
            return UITableViewCell()
        }

        cell.configure(with: model)

        return cell
    }
}
