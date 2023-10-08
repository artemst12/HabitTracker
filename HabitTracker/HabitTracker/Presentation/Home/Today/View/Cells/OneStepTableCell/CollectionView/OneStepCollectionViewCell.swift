//
//  TodayCollectionViewCell.swift
//  HabitTracker
//
//  Created by Артем Ступников on 20.09.2023.
//

import UIKit

final class OneStepCollectionViewCell: UICollectionViewCell {
    
    private var background: UIView?
    private var viewForImage: UIView?
    private var imageView: UIImageView?
    private var habitLabel: UILabel?
    private var activeButton: UIButton?
    
    static let reuseIdentifier = String(describing: OneStepCollectionViewCell.self)
    
    func configure(with model: OneStepHabit) {
        imageView?.image = .init(systemName: "")
        habitLabel?.text = model.name
        activeButton?.isEnabled = model.done
    }
    
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
        
        let activeButton = UIButton()
        activeButton.translatesAutoresizingMaskIntoConstraints = false
        activeButton.setImage(UIImage(named: ""), for: .normal)
        
        addSubview(background)
        background.addSubview(viewForImage)
        viewForImage.addSubview(imageView)
        background.addSubview(habitLabel)
        background.addSubview(activeButton)
        
        NSLayoutConstraint.activate([
            
            background.topAnchor.constraint(equalTo: topAnchor),
            background.leadingAnchor.constraint(equalTo: leadingAnchor),
            background.trailingAnchor.constraint(equalTo: trailingAnchor),
            background.bottomAnchor.constraint(equalTo: bottomAnchor),
            
            viewForImage.leadingAnchor.constraint(equalTo: background.leadingAnchor, constant: 10),
            viewForImage.centerYAnchor.constraint(equalTo: background.centerYAnchor),
            viewForImage.heightAnchor.constraint(equalToConstant: 30),
            viewForImage.widthAnchor.constraint(equalToConstant: 30),
            
            imageView.centerXAnchor.constraint(equalTo: viewForImage.centerXAnchor),
            imageView.centerYAnchor.constraint(equalTo: viewForImage.centerYAnchor),
            
            habitLabel.centerYAnchor.constraint(equalTo: viewForImage.centerYAnchor),
            habitLabel.leadingAnchor.constraint(equalTo: viewForImage.trailingAnchor, constant: 10),
            
            activeButton.centerYAnchor.constraint(equalTo: background.centerYAnchor),
            activeButton.trailingAnchor.constraint(equalTo: background.trailingAnchor, constant: -10),
            
            ])
        
        self.background = background
        self.viewForImage = viewForImage
        self.imageView = imageView
        self.habitLabel = habitLabel
        self.activeButton = activeButton
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
