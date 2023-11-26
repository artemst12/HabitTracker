//
//  CustomPersonalHabitStackView.swift
//  HabitTracker
//
//  Created by Артем Ступников on 15.11.2023.
//

import UIKit

final class CustomPersonalHabitStackView: UIView {
    
    private var iconView: UIView!
    private var colorView: UIView!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.translatesAutoresizingMaskIntoConstraints = false
        setupUI()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension CustomPersonalHabitStackView {
    
    func setupUI() {
        setupViews()
        setupConstraints()
    }
    
    func createView(image: String, text: String) -> UIView {
        
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = Colors.forSettingsNewHabit
        view.layer.cornerRadius = 18
        
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.backgroundColor = .clear
        
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: 14, weight: .regular)
        label.text = text
        
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.image = UIImage(named: image)
        
        view.addSubview(button)
        view.addSubview(label)
        view.addSubview(imageView)
        
        NSLayoutConstraint.activate([
        
            view.heightAnchor.constraint(equalToConstant: 35),
//            view.widthAnchor.constraint(equalToConstant: 100),
            view.trailingAnchor.constraint(equalTo: label.trailingAnchor, constant: 20),
            
            
            button.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            button.topAnchor.constraint(equalTo: view.topAnchor),
            button.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            button.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            
            imageView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            imageView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 3),
            imageView.heightAnchor.constraint(equalToConstant: 30),
            imageView.widthAnchor.constraint(equalToConstant: 30),
            
            label.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            label.leadingAnchor.constraint(equalTo: imageView.trailingAnchor, constant: 3),
        
        ])
        
        return view
    }
    
    func setupViews() {
        iconView = createView(image: "😎", text: "Icon")
        colorView = createView(image: "", text: "Colour")
        
        let views: [UIView] = [iconView, colorView]
        
        views.forEach { view in
            addSubview(view)
        }
    }
    
    func setupConstraints() {
        
        NSLayoutConstraint.activate([
            
            iconView.topAnchor.constraint(equalTo: topAnchor),
            iconView.leadingAnchor.constraint(equalTo: leadingAnchor),
            
            colorView.topAnchor.constraint(equalTo: topAnchor),
            colorView.leadingAnchor.constraint(equalTo: iconView.trailingAnchor, constant: 10),
            
        ])
    }
}
