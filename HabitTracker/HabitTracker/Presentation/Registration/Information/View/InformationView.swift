//
//  InformationView.swift
//  HabitTracker
//
//  Created by Артем Ступников on 26.06.2023.
//

import UIKit

final class InformationView: UIViewController, UITextFieldDelegate, UIGestureRecognizerDelegate {
    
    var output: InformationViewOutput?
        
    private let titleLabel = StyledLabel(
        font: .systemFont(ofSize: Fonts.titleSize, weight: Weigth.bold),
        color: Colors.white
    )
    
    private let enterNameLabel = StyledLabel(
        font: .systemFont(ofSize: Fonts.descriptionSize, weight: Weigth.medium),
        color: Colors.lightGray
    )
    
    private let enterDateLabel = StyledLabel(
        font: .systemFont(ofSize: Fonts.descriptionSize, weight: Weigth.medium),
        color: Colors.lightGray
    )
    
    private var nameField = CustomTextField()
    private var dateField = CustomTextField()
    
    private let datePicker = DatePicker()
    
    private let nextButton = CustomButton()

    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
}

// MARK: InformationViewInput
extension InformationView: InformationViewInput {
}

// MARK: Methods
 extension InformationView {
    
    func setupUI() {
        setupView()
        setupLabels()
        setupTextFields()
//        swipe()
        hideKeyboardWhenTappedAround()
        setupButtons()
        createDatepicker()
        setupConstraints()
    }
    
    func setupView() {
        view.backgroundColor = Colors.background
    }
    
    func setupLabels() {
        titleLabel.text = "Fill your information!"
        view.addSubview(titleLabel)
        
        enterNameLabel.text = "Enter your name"
        view.addSubview(enterNameLabel)
        
        enterDateLabel.text = "Enter your date of birth"
        view.addSubview(enterDateLabel)
    }
    
    func setupTextFields() {
        view.addSubview(nameField)
        view.addSubview(dateField)

//        TextFieldValidator(changedAction: { state in
//            let hasError = [nameField, dateField]
//                .map { $0.isValid }
//                .contains(false)
//
//            nextButton.isEnabled = !hasError
//        })
    
        nameField.set(delegate: TextFieldValidator())
        dateField.set(delegate: TextFieldValidator())

        nameField.setLeftPaddingPoints(10)
        nameField.setRightPaddingPoints(10)
        
        dateField.setLeftPaddingPoints(10)
        dateField.setRightPaddingPoints(10)
    }
    
//    func gestureRecognizer(_ gestureRecognizer: UIGestureRecognizer, shouldRecognizeSimultaneouslyWith otherGestureRecognizer: UIGestureRecognizer) -> Bool {
//        return true
//    }
//
//    func swipe() {
//        let swipeDown = UISwipeGestureRecognizer(target: self, action: #selector(hideKeyboardOnSwipeDown))
//        swipeDown.delegate = self
//        swipeDown.direction = UISwipeGestureRecognizer.Direction.down
//    }
//
//    @objc func hideKeyboardOnSwipeDown() {
//        view.endEditing(true)
//    }

    func createDatepicker() {
        datePicker.preferredDatePickerStyle = .wheels
        datePicker.datePickerMode = .date
        datePicker.setValue(Colors.darkBlack, forKeyPath: "textColor")
        datePicker.set(textfield: dateField)
    }
    
    func setupButtons() {
        nextButton.setTitle("Next", for: .normal)
        nextButton.addAction(.init(handler: { [weak self] action in
            self?.output?.nextButtonTapped()
        }), for: .touchUpInside)
        view.addSubview(nextButton)
        
        let fields = [nameField, dateField]
            .map { $0.isValid }
            .contains(false)
        
//        nextButton.isEnabled = !hasError
    }

    func setupConstraints() {
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 160),
            titleLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            titleLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),
            titleLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30),
            
            enterNameLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 50),
            enterNameLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 25),
            
            nameField.topAnchor.constraint(equalTo: enterNameLabel.bottomAnchor, constant: 15),
            nameField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 25),
            nameField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -25),
            nameField.heightAnchor.constraint(equalToConstant: 50),
            
            enterDateLabel.topAnchor.constraint(equalTo: nameField.bottomAnchor, constant: 30),
            enterDateLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 25),
            
            dateField.topAnchor.constraint(equalTo: enterDateLabel.bottomAnchor, constant: 15),
            dateField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 25),
            dateField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -25),
            dateField.heightAnchor.constraint(equalToConstant: 50),
            
            nextButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -40),
            nextButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 25),
            nextButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -25),
            nextButton.heightAnchor.constraint(equalToConstant: 55)
        ])
    }
}

// Скрытие клавиатуры
private extension InformationView {
    func hideKeyboardWhenTappedAround() {
        let tap = UITapGestureRecognizer(target: self, action: #selector(dismissKeyboard))
        tap.cancelsTouchesInView = false
        view.addGestureRecognizer(tap)
    }
    
    @objc func dismissKeyboard() {
        view.endEditing(true)
    }
}

// TODO: Скрытие клавиатуры +
// TODO: Скрытие кнопки назад
// TODO: Отступы слева и справа у поля ввода (?) +
// TODO: Нет отслеживания состояния заполненности полей
// TODO: Цвета вынести в отдельные enum в дизайн систему +
// TODO: Date Picker в отдельный компонент +
