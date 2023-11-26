//
//  CustomBackButton.swift
//  HabitTracker
//
//  Created by Артем Ступников on 15.11.2023.
//

import UIKit

final class BackTitledButton: UIView {

    enum ImageState {
        case crosshair
        case arrow
    }

    private let title: UILabel = .init()
    private let imageView: UIImageView = .init()
    private var action: (() -> Void)?

    convenience init(title: String? = nil, type: ImageState, action: @escaping () -> Void) {
        self.init(frame: .zero)

        self.action = action
        self.title.text = title

        switch type {
        case .arrow:
            imageView.image = .init(named: "arrow")?.withRenderingMode(.alwaysTemplate)
        case .crosshair:
            imageView.image = .init(named: "backButton")?.withRenderingMode(.alwaysTemplate)
        }
    }

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
        setupActions()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func setupView() {
        self.addSubview(imageView)
        imageView.translatesAutoresizingMaskIntoConstraints = false


        self.addSubview(title)
        title.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
            imageView.topAnchor.constraint(equalTo: self.topAnchor, constant: 5),
            imageView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 16),
            imageView.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: 5),

            imageView.heightAnchor.constraint(equalToConstant: 24),
            imageView.widthAnchor.constraint(equalToConstant: 24),

            title.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            title.leadingAnchor.constraint(equalTo: imageView.trailingAnchor, constant: 6),
            title.centerYAnchor.constraint(equalTo: imageView.centerYAnchor)
        ])
    }

    private func setupActions() {
        let gesture = UITapGestureRecognizer(target: self, action: #selector(tapAction))
        self.addGestureRecognizer(gesture)
    }

    @objc
    private func tapAction() {
        action?()
    }
}
