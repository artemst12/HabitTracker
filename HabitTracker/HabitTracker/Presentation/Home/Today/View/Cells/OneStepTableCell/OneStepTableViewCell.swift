//
//  OneStepTableViewCell.swift
//  HabitTracker
//
//  Created by Артем Ступников on 04.10.2023.
//

import UIKit

final class OneStepTableViewCell: UITableViewCell {
    
    private var background: UIView?
    private var viewForImage: UIView?
    private var image: UIImageView?
    private var habitLabel: UILabel?
    private var checkBox: CheckBox?

    private var model: OneStepHabit? = nil

    static let reuseIdentifier = String(describing: OneStepTableViewCell.self)
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)

        initTableView()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func prepareForReuse() {
        super.prepareForReuse()
        image?.image = nil
        habitLabel?.text = nil
        checkBox?.set(state: false)
    }

    func configure(with model: OneStepHabit) {
        image?.image = .init(named: model.emoji)
        habitLabel?.text = model.name
        checkBox?.set(state: model.done)
    }

    private func initTableView() {

        let background = UIView()
        background.translatesAutoresizingMaskIntoConstraints = false
        background.layer.cornerRadius = 24
        background.backgroundColor = Colors.disable

        let viewForImage = UIView()
        viewForImage.translatesAutoresizingMaskIntoConstraints = false
        viewForImage.layer.cornerRadius = 20
        viewForImage.backgroundColor = Colors.lightDark

        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false

        let habitLabel = UILabel()
        habitLabel.translatesAutoresizingMaskIntoConstraints = false
        habitLabel.font = .systemFont(ofSize: 16, weight: .bold)

        let checkBox = CheckBox()
        checkBox.translatesAutoresizingMaskIntoConstraints = false
        checkBox.set(done: "done", undone: "undone")
        checkBox.set { [weak self] isDone in
            // self?.output?.checkBoxActive(isDone)
        }

        contentView.addSubview(background)
        background.addSubview(viewForImage)
        viewForImage.addSubview(imageView)
        background.addSubview(habitLabel)
        background.addSubview(checkBox)

        self.selectionStyle = .none
        
        NSLayoutConstraint.activate([
                        
            background.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 5),
            background.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
            background.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -20),
            background.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -5),
            background.heightAnchor.constraint(equalToConstant: 80),

            viewForImage.leadingAnchor.constraint(equalTo: background.leadingAnchor, constant: 20),
            viewForImage.centerYAnchor.constraint(equalTo: background.centerYAnchor),
            viewForImage.heightAnchor.constraint(equalToConstant: 45),
            viewForImage.widthAnchor.constraint(equalToConstant: 45),

            imageView.centerXAnchor.constraint(equalTo: viewForImage.centerXAnchor),
            imageView.centerYAnchor.constraint(equalTo: viewForImage.centerYAnchor),
            imageView.leadingAnchor.constraint(equalTo: viewForImage.leadingAnchor, constant: 8),
            imageView.trailingAnchor.constraint(equalTo: viewForImage.trailingAnchor, constant: -8),
            imageView.topAnchor.constraint(equalTo: viewForImage.topAnchor, constant: 8),
            imageView.bottomAnchor.constraint(equalTo: viewForImage.bottomAnchor, constant: -8),

            habitLabel.centerYAnchor.constraint(equalTo: viewForImage.centerYAnchor),
            habitLabel.leadingAnchor.constraint(equalTo: viewForImage.trailingAnchor, constant: 10),

            checkBox.centerYAnchor.constraint(equalTo: background.centerYAnchor),
            checkBox.trailingAnchor.constraint(equalTo: background.trailingAnchor, constant: -10),
            checkBox.heightAnchor.constraint(equalToConstant: 35),
            checkBox.widthAnchor.constraint(equalToConstant: 35)

        ])

        self.background = background
        self.viewForImage = viewForImage
        self.image = imageView
        self.habitLabel = habitLabel
        self.checkBox = checkBox
    }
}
