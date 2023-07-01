//
//  CustomLabel.swift
//  HabitTracker
//
//  Created by Артем Ступников on 23.06.2023.
//

import UIKit

final class StyledLabel: UILabel {

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    convenience init(font: UIFont, color: UIColor) {
        self.init(frame: .zero)
        self.set(font: font)
        self.set(color: color)
    }
}

// MARK: - Private methods
private extension StyledLabel {

    func setupUI() {
        setupLabel()
        setupView()
    }

    func setupView() {
        self.translatesAutoresizingMaskIntoConstraints = false
    }

    func setupLabel() {
        self.textAlignment = .center
        self.numberOfLines = 0
    }

    func set(color: UIColor) {
        self.textColor = color
    }

    func set(font: UIFont) {
        self.font = font
    }
}
