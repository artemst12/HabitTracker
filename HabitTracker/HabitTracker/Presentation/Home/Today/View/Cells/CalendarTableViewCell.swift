//
//  CalendarTableViewCell.swift
//  HabitTracker
//
//  Created by Артем Ступников on 30.09.2023.
//

import UIKit

final class CalendarTableViewCell: UITableViewCell {
    
    private var collectionView: UICollectionView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        initcollectionView()
    }
    
    private func initcollectionView() {
        contentView.addSubview(collectionView)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            
            collectionView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            collectionView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
            collectionView.topAnchor.constraint(equalTo: contentView.topAnchor),
            collectionView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor)

        ])
    }
}

