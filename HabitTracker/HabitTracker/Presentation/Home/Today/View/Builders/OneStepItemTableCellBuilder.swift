//
//  OneStepItemTableCellBuilder.swift
//  HabitTracker
//
//  Created by Артем Ступников on 04.10.2023.
//

import UIKit

final class OneStepItemTableCellBuilder: TodayCellBuilder {
    func set(output: MultiStepCollectionViewCellProtocol) {
        
    }
    

    private weak var tableView: UITableView?
    private var model: OneStepHabit?
    private var cell: UITableViewCell?

    var isSelected: Bool {
        return model?.done ?? false
    }

    func set(tableView: UITableView?) {
        self.tableView = tableView
    }

    func set(model: OneStepHabit) {
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
        
        cell.backgroundColor = Colors.background
        cell.configure(with: model)

        return cell
    }
}
