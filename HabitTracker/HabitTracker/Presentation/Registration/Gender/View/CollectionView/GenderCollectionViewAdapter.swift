//
//  GenderCollectionViewAdapter.swift
//  HabitTracker
//
//  Created by Артем Ступников on 05.07.2023.
//

import UIKit

protocol GenderCollectionViewAdapterOutput {
    
}

final class GenderCollectionViewAdapter: NSObject {
    
    private var data: [EmojiItems] = []
    private var collectionView: UICollectionView?
    private var output: GenderCollectionViewAdapterOutput?
    
    init(data: [EmojiItems], collectionView: UICollectionView, output: GenderCollectionViewAdapterOutput) {
        self.data = data
        self.collectionView = collectionView
        self.output = output
        
        self.collectionView?.register(GenderCollectionViewCell.self, forCellWithReuseIdentifier: "GenderCollectionViewCell")
    }
    
    func reload() {
        self.collectionView?.reloadData()
    }
}

extension GenderCollectionViewAdapter: UICollectionViewDelegate, UICollectionViewDataSource {

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return data.count
    }

    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        guard let tappedCell = collectionView.cellForItem(at: indexPath) as? GenderCollectionViewCell else {
            return
        }
        
        
    }
        
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "GenderCollectionViewCell", for: indexPath) as? GenderCollectionViewCell else {
            return UICollectionViewCell()
        }
        
        cell.configure()

        return cell
    }
}
