//
//  GenderCollectionViewCell.swift
//  HabitTracker
//
//  Created by Артем Ступников on 08.07.2023.
//

import UIKit

final class GenderCollectionViewCell: UICollectionViewCell {
    
    private var background: UIView?
    private var emoji: UILabel?
    private var label: UILabel?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        let backgroundView = UIView()
        backgroundView.translatesAutoresizingMaskIntoConstraints = false
        backgroundView.backgroundColor = Colors.lightBlack
        backgroundView.layer.cornerRadius = Constants.cornerRadiusGenderButton

        let emojiLabel = UILabel()
        emojiLabel.font = .systemFont(ofSize: Fonts.emojiSize, weight: .semibold)
        emojiLabel.translatesAutoresizingMaskIntoConstraints = false
        
        let genderLabel = UILabel()
        genderLabel.font = .systemFont(ofSize: Fonts.buttonLabelSize, weight: .semibold)
        genderLabel.textColor = Colors.white
        genderLabel.translatesAutoresizingMaskIntoConstraints = false
        
        addSubview(backgroundView)
        backgroundView.addSubview(emojiLabel)
        backgroundView.addSubview(genderLabel)
        
        NSLayoutConstraint.activate([
            backgroundView.topAnchor.constraint(equalTo: topAnchor),
            backgroundView.leadingAnchor.constraint(equalTo: leadingAnchor),
            backgroundView.trailingAnchor.constraint(equalTo: trailingAnchor),
            backgroundView.bottomAnchor.constraint(equalTo: bottomAnchor),
            
            emojiLabel.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            emojiLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: 15),

            genderLabel.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            genderLabel.topAnchor.constraint(equalTo: emojiLabel.bottomAnchor, constant: 15),
            genderLabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -12),
        ])
        
        self.background = backgroundView
        self.emoji = emojiLabel
        self.label = genderLabel
    }

    // TODO: ScrollView при открытой клавиатуре +
    // TODO: systemLayoutSizeFitting (автоматический размер для ячеек Gender)
    // TODO: Доделать состояния State для TextValidator.
    
//    override func systemLayoutSizeFitting(
//        _ targetSize: CGSize,
//        withHorizontalFittingPriority horizontalFittingPriority: UILayoutPriority,
//        verticalFittingPriority: UILayoutPriority
//    ) -> CGSize {
//        return .init(width: 160, height: 180)
//    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func configure(emojiText: String, genderText: String) {
        emoji?.text = emojiText
        label?.text = genderText
    }
}
