//
//  BuilderProtocol.swift
//  HabitTracker
//
//  Created by Pavel Marinchenko on 08.10.2023.
//

import UIKit

protocol TodayCellBuilder {

    associatedtype ViewModel

    var isSelected: Bool { get }

    func set(tableView: UITableView?)
    func set(model: ViewModel)
    func set(output: MultiStepCollectionViewCellProtocol)
    func build() -> UITableViewCell
}
