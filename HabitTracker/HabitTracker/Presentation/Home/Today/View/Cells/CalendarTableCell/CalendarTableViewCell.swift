//
//  CalendarTableViewCell.swift
//  HabitTracker
//
//  Created by Артем Ступников on 30.09.2023.
//

import UIKit

final class CalendarTableViewCellModel {

    let items: [CalendarDayItem]

    init(items: [CalendarDayItem]) {
        self.items = items
    }
}

final class CalendarTableViewCell: UITableViewCell {
    
    private var collectionView: UICollectionView!
    private var model: CalendarTableViewCellModel? = nil

    static let reuseIdentifier = String(describing: CalendarTableViewCell.self)

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)

        initCollectionView()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func configure(with model: CalendarTableViewCellModel) {
        self.model = model
        collectionView.reloadData()
    }

    private func initCollectionView() {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.estimatedItemSize = .init(width: 50, height: 100)
        layout.itemSize = .init(width: 50, height: 100)
        layout.minimumLineSpacing = 16
//        layout.sectionInset = .init(top: 0, left: 25, bottom: 0, right: 25)

        collectionView = .init(frame: .zero, collectionViewLayout: layout)
        collectionView.dataSource = self
        collectionView.backgroundColor = Colors.background
        // collectionView.delegate = self

        collectionView.register(
            CalendarCollectionViewCell.self,
            forCellWithReuseIdentifier: CalendarCollectionViewCell.reuseIdentifier
        )
        
        contentView.backgroundColor = Colors.background

        contentView.addSubview(collectionView)
        collectionView.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
            
            collectionView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            collectionView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
            collectionView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: -20),
            collectionView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            collectionView.heightAnchor.constraint(equalToConstant: 140)
        ])
    }
}

extension CalendarTableViewCell: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        model?.items.count ?? 0
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(
            withReuseIdentifier: CalendarCollectionViewCell.reuseIdentifier,
            for: indexPath
        ) as? CalendarCollectionViewCell,
              let model = self.model
        else {
            return UICollectionViewCell()
        }

        let cellModel = model.items[indexPath.row]
        cell.configure(with: cellModel)

        return cell
    }
}
