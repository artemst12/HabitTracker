//
//  CalendarCollectionViewCell.swift
//  HabitTracker
//
//  Created by Артем Ступников on 19.09.2023.
//

import UIKit

final class CalendarCollectionViewCell: UICollectionViewCell {
    
    private var dayView: UIView?
    private var smileImage: UIImageView?
    private var currentDayLabel: UILabel?
    private var dateLabel: UILabel?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        let dayView = UIView()
        dayView.translatesAutoresizingMaskIntoConstraints = false
        dayView.backgroundColor = Colors.darkBlack
        dayView.layer.cornerRadius = 10
        
        let currentDayLabel = UILabel()
        dayView.addSubview(currentDayLabel)
        currentDayLabel.translatesAutoresizingMaskIntoConstraints = false
        currentDayLabel.font = .systemFont(ofSize: 14, weight: .semibold)
        
        let dateLabel = UILabel()
        dayView.addSubview(dateLabel)
        dateLabel.translatesAutoresizingMaskIntoConstraints = false
        dateLabel.font = .systemFont(ofSize: 14, weight: .semibold)
        
        let smileImage = UIImageView()
        smileImage.translatesAutoresizingMaskIntoConstraints = false
        
        addSubview(dayView)
        dayView.addSubview(currentDayLabel)
        dayView.addSubview(dateLabel)
        addSubview(smileImage)
        
        NSLayoutConstraint.activate([
            
            dayView.topAnchor.constraint(equalTo: topAnchor),
            dayView.leadingAnchor.constraint(equalTo: leadingAnchor),
            dayView.trailingAnchor.constraint(equalTo: trailingAnchor),
            dayView.widthAnchor.constraint(equalToConstant: 50),
            
            currentDayLabel.topAnchor.constraint(equalTo: dayView.topAnchor, constant: 5),
            currentDayLabel.leadingAnchor.constraint(equalTo: dayView.leadingAnchor, constant: 5),
            currentDayLabel.trailingAnchor.constraint(equalTo: dayView.trailingAnchor, constant: -5),
            currentDayLabel.bottomAnchor.constraint(equalTo: dayView.bottomAnchor, constant: -10),
            
            dateLabel.topAnchor.constraint(equalTo: currentDayLabel.topAnchor, constant: 5),
            dateLabel.leadingAnchor.constraint(equalTo: dayView.leadingAnchor, constant: 5),
            dateLabel.trailingAnchor.constraint(equalTo: dayView.trailingAnchor, constant: -5),
            dateLabel.bottomAnchor.constraint(equalTo: dayView.bottomAnchor, constant: -5),
            
            smileImage.topAnchor.constraint(equalTo: dayView.bottomAnchor, constant: 5),
            smileImage.widthAnchor.constraint(equalToConstant: 40),
            smileImage.heightAnchor.constraint(equalToConstant: 40),
            
        ])
        
        self.dayView = dayView
        self.smileImage = smileImage
        self.currentDayLabel = currentDayLabel
        self.dateLabel = dateLabel
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
