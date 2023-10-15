//
//  OneStepTableViewCell.swift
//  HabitTracker
//
//  Created by Артем Ступников on 04.10.2023.
//

import UIKit

final class OneStepTableViewCellModel {

    let items: [OneStepHabit]

    init(items: [OneStepHabit]) {
        self.items = items
    }
}

final class OneStepTableViewCell: UITableViewCell {
    
    private var tableView: UITableView!
    private var model: OneStepTableViewCellModel? = nil
    
    static let reuseIdentifier = String(describing: OneStepTableViewCell.self)
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)

        initTableView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configure(with model: OneStepTableViewCellModel) {
        self.model = model
        tableView.reloadData()
    }
    
    private func initTableView() {
        
        tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.separatorStyle = .none
        tableView.rowHeight = UITableView.automaticDimension
        tableView.backgroundColor = .white

        tableView.dataSource = self
//        tableView.delegate = self
        
        addSubview(tableView)

//        tableView.register(OneStepCollectionViewCell.self, forCellWithReuseIdentifier: OneStepCollectionViewCell.reuseIdentifier)

        NSLayoutConstraint.activate([
//            tableView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
//            tableView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
//            tableView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10),
//            tableView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
//            tableView.heightAnchor.constraint(equalToConstant: 140)
        ])
    }

}

extension OneStepTableViewCell: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        model?.items.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(
            withIdentifier: OneStepCollectionViewCell.reuseIdentifier,
            for: indexPath
        ) as? OneStepCollectionViewCell,
              let model = self.model
        else {
            return UITableViewCell()
        }

        let cellModel = model.items[indexPath.row]
        cell.configure(with: cellModel)

        return cell
    }
}
