//
//  MultiStepBuilder.swift
//  HabitTracker
//
//  Created by Артем Ступников on 12.10.2023.
//

import UIKit

final class MultiStepItemTableCellBuilder: TodayCellBuilder {

    private weak var tableView: UITableView?
    private var model: MultiStepTableViewCellModel?
    private var cell: UITableViewCell?

    func set(tableView: UITableView?) {
        self.tableView = tableView
    }

    func set(model: MultiStepTableViewCellModel) {
        self.model = model
    }

    func build() -> UITableViewCell {
        guard let cell = self.tableView?.dequeueReusableCell(
            withIdentifier: MultiStepTableViewCell.reuseIdentifier
        ) as? MultiStepTableViewCell else {
            return UITableViewCell()
        }

        guard let model else {
            return UITableViewCell()
        }

        cell.configure(with: model)

        return cell
    }
}
