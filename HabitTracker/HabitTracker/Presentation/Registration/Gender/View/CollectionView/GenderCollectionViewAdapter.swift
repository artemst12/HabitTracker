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
        
        self.collectionView?.register(CustomGenderButton.self, forCellWithReuseIdentifier: "CustomGenderButton")
    }
    
    func reload() {
        self.collectionView?.reloadData()
    }
}

//extension GenderCollectionViewAdapter: UICollectionViewDelegate, UICollectionViewDataSource {
//
//    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
//        return data.count
//    }
//
//    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
//        guard collectionView.cellForItem(at: indexPath) is CustomGenderButton else {
//            return
//        }
//    }
        
//    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
//        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CustomGenderButton", for: indexPath) as? CustomGenderButton else {
//            return UICollectionViewCell()
//        }
//
//        let currentModel = data[indexPath.row]
//        cell.configure(emojiText: currentModel.emoji, genderText: currentModel.genderLabel)
//
//        return cell
//    }
//}
