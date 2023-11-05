//
//  OneStepCollectionViewCell.swift
//  HabitTracker
//
//  Created by Артем Ступников on 20.09.2023.
//

import UIKit

final class MultiStepCollectionViewCell: UICollectionViewCell {
    
    private var background: UIView?
    private var viewForImage: UIView?
    private var label: UILabel?
    private var imageView: UIImageView?
    private var habitLabel: UILabel?
    private var countLabel: UILabel?
    private var glassLabel: UILabel?
    private var viewForButtons: UIView?
    private var minusButton: UIButton?
    private var plusButton: UIButton?
    private var countDone = 0
    private var presenter: TodayPresenter?
    
    static let reuseIdentifier = String(describing: MultiStepCollectionViewCell.self)
    
    override func prepareForReuse() {
        super.prepareForReuse()
        // reset all data
    }
    
    func configure(with model: MultiStepHabit) {
        
        switch model.image {
        case .image(let image):
            imageView?.image = .init(named: image)
            imageView?.isHidden = false
            label?.isHidden = true
        
        case .emoji(let emoji):
            label?.text = emoji
            imageView?.isHidden = true
            label?.isHidden = false
        }
        
        habitLabel?.text = model.habitLabel
        countLabel?.text = model.countLabel
        glassLabel?.text = model.label
        minusButton?.setImage(.init(named: model.minusButton), for: .normal)
        plusButton?.setImage(.init(named: model.plusButton), for: .normal)
    }

    override init(frame: CGRect) {
        super.init(frame: frame)
        
        let background = UIView()
        background.translatesAutoresizingMaskIntoConstraints = false
        background.layer.cornerRadius = 24
        background.backgroundColor = Colors.lightBlack
        
        let viewForImage = UIView()
        viewForImage.translatesAutoresizingMaskIntoConstraints = false
        viewForImage.layer.cornerRadius = 22
        viewForImage.backgroundColor = Colors.lightDark
        
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFit
        
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: 24)
        label.textAlignment = .center
        
        let habitLabel = UILabel()
        habitLabel.translatesAutoresizingMaskIntoConstraints = false
        habitLabel.font = .systemFont(ofSize: 20, weight: .bold)
        
        let countLabel = UILabel()
        countLabel.translatesAutoresizingMaskIntoConstraints = false
        countLabel.font = .systemFont(ofSize: 28, weight: .bold)
        
        let glassLabel = UILabel()
        glassLabel.translatesAutoresizingMaskIntoConstraints = false
        glassLabel.font = .systemFont(ofSize: 14, weight: .semibold)
        
        let viewForButtons = UIView()
        viewForButtons.translatesAutoresizingMaskIntoConstraints = false
        viewForButtons.backgroundColor = Colors.lightDark
        viewForButtons.layer.cornerRadius = 20
                
        let minusButton = UIButton()
        minusButton.translatesAutoresizingMaskIntoConstraints = false
//        minusButton.addTarget(self, action: #selector(), for: .touchUpInside)
        
        let plusButton = UIButton()
        plusButton.translatesAutoresizingMaskIntoConstraints = false
        
        addSubview(background)
        background.addSubview(viewForImage)
        viewForImage.addSubview(imageView)
        viewForImage.addSubview(label)
        background.addSubview(habitLabel)
        background.addSubview(countLabel)
        background.addSubview(glassLabel)
        background.addSubview(viewForButtons)
        viewForButtons.addSubview(minusButton)
        viewForButtons.addSubview(plusButton)

        NSLayoutConstraint.activate([
            
            background.topAnchor.constraint(equalTo: topAnchor),
            background.leadingAnchor.constraint(equalTo: leadingAnchor),
            background.trailingAnchor.constraint(equalTo: trailingAnchor),
            background.bottomAnchor.constraint(equalTo: bottomAnchor),
            background.heightAnchor.constraint(equalToConstant: 320),
            background.widthAnchor.constraint(equalToConstant: 200),
            
            viewForImage.topAnchor.constraint(equalTo: background.topAnchor, constant: 15),
            viewForImage.leadingAnchor.constraint(equalTo: background.leadingAnchor, constant: 15),
            viewForImage.heightAnchor.constraint(equalToConstant: 45),
            viewForImage.widthAnchor.constraint(equalToConstant: 45),
            
            imageView.centerXAnchor.constraint(equalTo: viewForImage.centerXAnchor),
            imageView.centerYAnchor.constraint(equalTo: viewForImage.centerYAnchor),
            imageView.leadingAnchor.constraint(equalTo: viewForImage.leadingAnchor, constant: 8),
            imageView.trailingAnchor.constraint(equalTo: viewForImage.trailingAnchor, constant: -8),
            imageView.topAnchor.constraint(equalTo: viewForImage.topAnchor, constant: 8),
            imageView.bottomAnchor.constraint(equalTo: viewForImage.bottomAnchor, constant: -8),
            
            label.topAnchor.constraint(equalTo: viewForImage.topAnchor),
            label.leadingAnchor.constraint(equalTo: viewForImage.leadingAnchor),
            label.trailingAnchor.constraint(equalTo: viewForImage.trailingAnchor),
            label.bottomAnchor.constraint(equalTo: viewForImage.bottomAnchor),
            
            habitLabel.centerYAnchor.constraint(equalTo: viewForImage.centerYAnchor),
            habitLabel.leadingAnchor.constraint(equalTo: viewForImage.trailingAnchor, constant: 10),
            
            countLabel.centerXAnchor.constraint(equalTo: background.centerXAnchor),
            countLabel.centerYAnchor.constraint(equalTo: background.centerYAnchor),
            
            glassLabel.topAnchor.constraint(equalTo: countLabel.bottomAnchor, constant: 5),
            glassLabel.centerXAnchor.constraint(equalTo: countLabel.centerXAnchor),
            
            viewForButtons.centerXAnchor.constraint(equalTo: background.centerXAnchor),
            viewForButtons.leadingAnchor.constraint(equalTo: background.leadingAnchor, constant: 40),
            viewForButtons.trailingAnchor.constraint(equalTo: background.trailingAnchor, constant: -40),
            viewForButtons.bottomAnchor.constraint(equalTo: background.bottomAnchor, constant: -20),
            viewForButtons.heightAnchor.constraint(equalToConstant: 40),
            
            minusButton.topAnchor.constraint(equalTo: viewForButtons.topAnchor),
            minusButton.leadingAnchor.constraint(equalTo: viewForButtons.leadingAnchor, constant: 12),
            minusButton.trailingAnchor.constraint(equalTo: viewForButtons.centerXAnchor, constant: -12),
            minusButton.bottomAnchor.constraint(equalTo: viewForButtons.bottomAnchor),
            
            plusButton.topAnchor.constraint(equalTo: viewForButtons.topAnchor),
            plusButton.leadingAnchor.constraint(equalTo: viewForButtons.centerXAnchor, constant: 12),
            plusButton.trailingAnchor.constraint(equalTo: viewForButtons.trailingAnchor, constant: -12),
            plusButton.bottomAnchor.constraint(equalTo: viewForButtons.bottomAnchor),
        ])
        
        self.background = background
        self.viewForImage = viewForImage
        self.imageView = imageView
        self.label = label
        self.habitLabel = habitLabel
        self.countLabel = countLabel
        self.glassLabel = glassLabel
        self.viewForButtons = viewForButtons
        self.minusButton = minusButton
        self.plusButton = plusButton
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
