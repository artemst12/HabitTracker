//
//  CalendarCollectionViewAdpater.swift
//  HabitTracker
//
//  Created by Артем Ступников on 24.09.2023.
//

import UIKit

extension TodayView: UICollectionViewDelegate, UICollectionViewDataSource {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        6
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CalendarCollectionViewCell", for: indexPath) as?
                CalendarCollectionViewCell else {
            return UICollectionViewCell()
        }
        
        return cell
    }
    
}
