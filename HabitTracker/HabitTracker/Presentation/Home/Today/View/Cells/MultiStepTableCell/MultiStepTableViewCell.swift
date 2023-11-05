//
//  MultiStepTableViewCell.swift
//  HabitTracker
//
//  Created by Артем Ступников on 07.10.2023.
//

import UIKit

final class MultiStepTableViewCellModel {

    let items: [MultiStepHabit]

    init(items: [MultiStepHabit]) {
        self.items = items
    }
}

final class MultiStepTableViewCell: UITableViewCell {
    
    private var collectionView: UICollectionView!
    private var model: MultiStepTableViewCellModel? = nil
    private var output: MultiStepCollectionViewCellProtocol?
    
    static let reuseIdentifier = String(describing: MultiStepTableViewCell.self)
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)

        initCollectionView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configure(with model: MultiStepTableViewCellModel, output: MultiStepCollectionViewCellProtocol) {
        self.model = model
        self.output = output
        collectionView.reloadData()
    }
    
    private func initCollectionView() {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.estimatedItemSize = .init(width: 150, height: 320)
        layout.itemSize = .init(width: 150, height: 320)
        layout.minimumLineSpacing = 16
//        layout.sectionInset = .init(top: 0, left: 25, bottom: 0, right: 25)

        collectionView = .init(frame: .zero, collectionViewLayout: layout)
        collectionView.dataSource = self
        collectionView.backgroundColor = Colors.background
        // collectionView.delegate = self

        collectionView.register(
            MultiStepCollectionViewCell.self,
            forCellWithReuseIdentifier: MultiStepCollectionViewCell.reuseIdentifier
        )
        
        contentView.backgroundColor = Colors.background

        contentView.addSubview(collectionView)
        collectionView.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
            collectionView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            collectionView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
            collectionView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 30),
            collectionView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            collectionView.heightAnchor.constraint(equalToConstant: 320)
        ])
    }

}

extension MultiStepTableViewCell: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        model?.items.count ?? 0
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(
            withReuseIdentifier: MultiStepCollectionViewCell.reuseIdentifier,
            for: indexPath
        ) as? MultiStepCollectionViewCell,
              let model = self.model,
              let output = self.output
        else {
            return UICollectionViewCell()
        }

        let cellModel = model.items[indexPath.row]

        cell.configure(with: cellModel, output: output)

        return cell
    }
}
