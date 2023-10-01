//
//  CheckInCollectionViewCell.swift
//  HabitTracker
//
//  Created by Артем Ступников on 20.09.2023.
//

import UIKit

final class CheckInCollectionViewCell: UICollectionViewCell {
    
    private var background: UIView?
    private var viewForImage: UIView?
    private var imageView: UIImageView?
    private var habitLabel: UILabel?
    private var countLabel: UILabel?
    private var viewForButtons: UIView?
    private var minusButton: UIButton?
    private var plusButton: UIButton?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        let background = UIView()
        background.translatesAutoresizingMaskIntoConstraints = false
        background.layer.cornerRadius = 16
        background.backgroundColor = Colors.darkBlack
        
        let viewForImage = UIView()
        viewForImage.translatesAutoresizingMaskIntoConstraints = false
        viewForImage.layer.cornerRadius = 36
        viewForImage.backgroundColor = Colors.lightGray
        
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        
        let habitLabel = UILabel()
        habitLabel.translatesAutoresizingMaskIntoConstraints = false
        habitLabel.font = .systemFont(ofSize: 16, weight: .bold)
        
        let countLabel = UILabel()
        countLabel.translatesAutoresizingMaskIntoConstraints = false
        countLabel.font = .systemFont(ofSize: 24, weight: .bold)
        
        let viewForButtons = UIView()
        viewForButtons.translatesAutoresizingMaskIntoConstraints = false
        viewForButtons.backgroundColor = Colors.lightGray
        
        let minusButton = UIButton()
        minusButton.translatesAutoresizingMaskIntoConstraints = false
        minusButton.setImage(UIImage(named: ""), for: .normal)
        
        let plusButton = UIButton()
        plusButton.translatesAutoresizingMaskIntoConstraints = false
        plusButton.setImage(UIImage(named: ""), for: .normal)
        
        addSubview(background)
        background.addSubview(viewForImage)
        viewForImage.addSubview(imageView)
        background.addSubview(habitLabel)
        background.addSubview(countLabel)
        background.addSubview(viewForButtons)
        viewForButtons.addSubview(minusButton)
        viewForButtons.addSubview(plusButton)
        
        NSLayoutConstraint.activate([
            
            background.topAnchor.constraint(equalTo: topAnchor),
            background.leadingAnchor.constraint(equalTo: leadingAnchor),
            background.trailingAnchor.constraint(equalTo: trailingAnchor),
            background.bottomAnchor.constraint(equalTo: bottomAnchor),
            
            viewForImage.topAnchor.constraint(equalTo: background.topAnchor, constant: 10),
            viewForImage.leadingAnchor.constraint(equalTo: background.leadingAnchor, constant: 10),
            viewForImage.heightAnchor.constraint(equalToConstant: 30),
            viewForImage.widthAnchor.constraint(equalToConstant: 30),
            
            imageView.centerXAnchor.constraint(equalTo: viewForImage.centerXAnchor),
            imageView.centerYAnchor.constraint(equalTo: viewForImage.centerYAnchor),
            
            habitLabel.centerYAnchor.constraint(equalTo: viewForImage.centerYAnchor),
            habitLabel.leadingAnchor.constraint(equalTo: viewForImage.trailingAnchor, constant: 10),
            
            countLabel.centerXAnchor.constraint(equalTo: background.centerXAnchor),
            countLabel.centerYAnchor.constraint(equalTo: background.centerYAnchor),
            
            viewForButtons.centerXAnchor.constraint(equalTo: background.centerXAnchor),
            viewForButtons.leadingAnchor.constraint(equalTo: background.leadingAnchor, constant: 30),
            viewForButtons.trailingAnchor.constraint(equalTo: background.trailingAnchor, constant: -30),
            viewForButtons.bottomAnchor.constraint(equalTo: background.bottomAnchor, constant: -10),
            
            minusButton.topAnchor.constraint(equalTo: viewForButtons.topAnchor),
            minusButton.leadingAnchor.constraint(equalTo: viewForButtons.leadingAnchor),
            minusButton.trailingAnchor.constraint(equalTo: viewForButtons.centerXAnchor),
            minusButton.bottomAnchor.constraint(equalTo: viewForButtons.bottomAnchor),
            
            plusButton.topAnchor.constraint(equalTo: viewForButtons.topAnchor),
            plusButton.leadingAnchor.constraint(equalTo: viewForButtons.centerXAnchor),
            plusButton.trailingAnchor.constraint(equalTo: viewForButtons.trailingAnchor),
            plusButton.bottomAnchor.constraint(equalTo: viewForButtons.bottomAnchor),
            
            ])
        
        self.background = background
        self.viewForImage = viewForImage
        self.imageView = imageView
        self.habitLabel = habitLabel
        self.countLabel = countLabel
        self.viewForButtons = viewForButtons
        self.minusButton = minusButton
        self.plusButton = plusButton
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
