//
//  OneStepItemTableCellBuilder.swift
//  HabitTracker
//
//  Created by Артем Ступников on 04.10.2023.
//

import UIKit

protocol TodayOneStepCellBuilder {

    associatedtype ViewModel

    func set(model: ViewModel)
    func set(cell: UITableViewCell)
    func build() -> UITableViewCell
}

final class OneStepItemTableCellBuilder: TodayOneStepCellBuilder {

    private var model: OneStepTableViewCellModel?
    private var cell: UITableViewCell?

    func set(model: OneStepTableViewCellModel) {
        self.model = model
    }

    func set(cell: UITableViewCell) {
        self.cell = cell
    }

    func build() -> UITableViewCell {
        guard let model, let cell = self.cell as? OneStepTableViewCell else {
            return UITableViewCell()
        }

        cell.configure(with: model)

        return cell
    }
}
