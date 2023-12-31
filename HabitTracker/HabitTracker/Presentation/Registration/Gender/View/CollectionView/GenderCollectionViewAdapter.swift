//
//  GenderCollectionViewAdapter.swift
//  HabitTracker
//
//  Created by Артем Ступников on 05.07.2023.
//

import UIKit

protocol GenderCollectionViewAdapterOutput {

    func selected(model: EmojiItems)
}

final class GenderCollectionViewAdapter: NSObject {
    
    private var data: [EmojiItems] = []
    private var selectedItem: EmojiItems?
    private var collectionView: UICollectionView?
    private var output: GenderCollectionViewAdapterOutput?
    
    init(data: [EmojiItems], collectionView: UICollectionView, output: GenderCollectionViewAdapterOutput) {
        self.data = data
        self.collectionView = collectionView
        self.output = output

        self.collectionView?.register(GenderCollectionViewCell.self, forCellWithReuseIdentifier: "GenderCollectionViewCell")
    }

    func set(data: [EmojiItems]) {
        self.data = data
    }

    func select(item: EmojiItems) {
        selectedItem = item

        for idx in 0..<data.count { // [male, female]
            if let cell = collectionView?.cellForItem(at: IndexPath(item: idx, section: 0)) as? GenderCollectionViewCell {
                cell.setSelected(selectedItem == data[idx])
            }
        }
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
        output?.selected(model: data[indexPath.item])
        print("item at \(indexPath.section)/\(indexPath.item) tapped")
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "GenderCollectionViewCell", for: indexPath) as? GenderCollectionViewCell else {
            return UICollectionViewCell()
        }

        let model = data[indexPath.item]
        cell.configure(emojiText: model.emoji, genderText: model.genderLabel)
        return cell
    }
}
