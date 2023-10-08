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
    
    private var collectionView: UICollectionView!
    private var model: OneStepTableViewCellModel? = nil
    
    static let reuseIdentifier = String(describing: OneStepTableViewCell.self)
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)

        initCollectionView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configure(with model: OneStepTableViewCellModel) {
        self.model = model
        collectionView.reloadData()
    }
    
    private func initCollectionView() {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        layout.estimatedItemSize = .init(width: 50, height: 300)
        layout.itemSize = .init(width: 50, height: 300)
        layout.minimumLineSpacing = 16
//        layout.sectionInset = .init(top: 0, left: 25, bottom: 0, right: 25)

        collectionView = .init(frame: .zero, collectionViewLayout: layout)
        collectionView.dataSource = self
        // collectionView.delegate = self

        collectionView.register(
            OneStepCollectionViewCell.self,
            forCellWithReuseIdentifier: OneStepCollectionViewCell.reuseIdentifier
        )

        contentView.addSubview(collectionView)
        collectionView.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
            collectionView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            collectionView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
            collectionView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10),
            collectionView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            collectionView.heightAnchor.constraint(equalToConstant: 140)
        ])
    }

}

extension OneStepTableViewCell: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        model?.items.count ?? 0
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(
            withReuseIdentifier: OneStepCollectionViewCell.reuseIdentifier,
            for: indexPath
        ) as? OneStepCollectionViewCell,
              let model = self.model
        else {
            return UICollectionViewCell()
        }

        let cellModel = model.items[indexPath.row]
        cell.configure(with: cellModel)

        return cell
    }
}
