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
    private var multiStepModel: MultiStepHabit?
    private var cell: UITableViewCell?
    private var output: MultiStepCollectionViewCellProtocol?
    
    var isSelected: Bool {
        return multiStepModel?.done ?? false
    }

    func set(tableView: UITableView?) {
        self.tableView = tableView
    }

    func set(model: MultiStepTableViewCellModel) {
        self.model = model
    }
    
    func set(output: MultiStepCollectionViewCellProtocol) {
        self.output = output
    }

    func build() -> UITableViewCell {
        guard let cell = self.tableView?.dequeueReusableCell(
            withIdentifier: MultiStepTableViewCell.reuseIdentifier
        ) as? MultiStepTableViewCell else {
            return UITableViewCell()
        }

        guard let model, let output else {
            return UITableViewCell()
        }

        cell.configure(with: model, output: output)

        return cell
    }
}
