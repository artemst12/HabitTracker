//
//  GenderCollectionViewCell.swift
//  HabitTracker
//
//  Created by Артем Ступников on 08.07.2023.
//

import UIKit

final class GenderCollectionViewCell: UICollectionViewCell {
    
    private var background: UIView?
    private var emojiLabel: UILabel?
    private var genderLabel: UILabel?

    override init(frame: CGRect) {
        super.init(frame: frame)
        
        let background = UIView()
        background.translatesAutoresizingMaskIntoConstraints = false
        background.backgroundColor = Colors.lightBlack
        background.layer.cornerRadius = Constants.cornerRadiusGenderButton

        let emojiLabel = UILabel()
        emojiLabel.font = .systemFont(ofSize: Fonts.emojiSize, weight: .semibold)
        emojiLabel.translatesAutoresizingMaskIntoConstraints = false

        let genderLabel = UILabel()
        genderLabel.font = .systemFont(ofSize: Fonts.buttonLabelSize, weight: .semibold)
        genderLabel.textColor = Colors.white
        genderLabel.translatesAutoresizingMaskIntoConstraints = false

        addSubview(background)
        background.addSubview(emojiLabel)
        background.addSubview(genderLabel)

        NSLayoutConstraint.activate([
            background.topAnchor.constraint(equalTo: topAnchor),
            background.leadingAnchor.constraint(equalTo: leadingAnchor),
            background.trailingAnchor.constraint(equalTo: trailingAnchor),
            background.bottomAnchor.constraint(equalTo: bottomAnchor),

            emojiLabel.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            emojiLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: 15),

            genderLabel.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            genderLabel.topAnchor.constraint(equalTo: emojiLabel.bottomAnchor, constant: 15),
            genderLabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -12),
        ])

        self.background = background
        self.emojiLabel = emojiLabel
        self.genderLabel = genderLabel
    }

    func setSelected(_ selected: Bool) {
        self.isSelected = selected
        self.background?.backgroundColor = selected
            ? Colors.lightGreen
            : Colors.lightBlack

        self.genderLabel?.textColor = selected
            ? .black
            : Colors.white
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
        emojiLabel?.text = emojiText
        genderLabel?.text = genderText
    }
}
