//
//  InformationView.swift
//  HabitTracker
//
//  Created by Артем Ступников on 26.06.2023.
//

import UIKit

final class InformationView: UIViewController, UITextFieldDelegate {
    
    var output: InformationViewOutput?
    
    private let titleLabel = StyledLabel(
        font: .systemFont(ofSize: 32, weight: .bold),
        color: .white
    )
    
    private let enterNameLabel = StyledLabel(
        font: .systemFont(ofSize: 14, weight: .medium),
        color: .lightGray
    )
    
    private let enterDateLabel = StyledLabel(
        font: .systemFont(ofSize: 14, weight: .medium),
        color: .lightGray
    )
    
    private let nextButton = CustomButton()
    
    private var nameField = CustomTextField()
    private var dateField = CustomTextField()
    private var changed: Bool = false
    
    private let datePicker = UIDatePicker()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
}

// MARK: InformationViewInput
extension InformationView: InformationViewInput {
}

// MARK: Private Methods
private extension InformationView {
    
    func setupUI() {
        setupView()
        setupLabels()
        setupTextFields()
        setupButtons()
        createDatepicker()
        setupConstraints()
    }
    
    func setupView() {
        view.backgroundColor = .black
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
        
        nameField.delegate = self
            
        nameField.set(icon: .add)
        dateField.set(icon: .add)
    }
    
    func createDatepicker() {
        datePicker.preferredDatePickerStyle = .wheels
        datePicker.datePickerMode = .date
        datePicker.backgroundColor = .init(red: 25/255, green: 25/255, blue: 25/255, alpha: 1)
        datePicker.setValue(UIColor.init(red: 210/255, green: 210/255, blue: 210/255, alpha: 1), forKeyPath: "textColor")
        
        dateField.inputView = datePicker
        dateField.inputAccessoryView = createToolbar()
    }
    
    func setupButtons() {
        nextButton.setTitle("Next", for: .normal)
        nextButton.addAction(.init(handler: { [weak self] action in
            self?.output?.nextButtonTapped()
        }), for: .touchUpInside)
        view.addSubview(nextButton)
        
//        nextButton.isEnabled = false
//        let textFields = [nameField, dateField]
//        for textField in textFields {
////            if changed == false {
//                textField.addTarget(self, action: #selector(textFieldDidChange), for: .editingChanged)
////            }
//        }
    }
//
//    @objc func textFieldDidChange(textField: UITextField) {
//
//        if nextButton.isEnabled == false {
//            nextButton.isEnabled = true
//        }
//    }
    
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

// DatePicker
private extension InformationView {
    
    func createToolbar() -> UIToolbar {
        // toolbar
        let toolbar = UIToolbar()
        toolbar.sizeToFit()
        toolbar.layer.cornerRadius = 20
        toolbar.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
        toolbar.clipsToBounds = true
        toolbar.barTintColor = .init(red: 8/255, green: 8/255, blue: 8/255, alpha: 1)
        
        let space = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: self, action: nil)
        let cancelButton = UIBarButtonItem(barButtonSystemItem: .stop, target: self, action: #selector(cancel))
        cancelButton.tintColor = .white
        
        // done button
        let doneBtn = UIBarButtonItem(barButtonSystemItem: .save, target: nil, action: #selector(donePressed))
        doneBtn.tintColor = .white
        toolbar.setItems([cancelButton, space, doneBtn], animated: true)
        
        return toolbar
    }
    
    @objc func cancel() {
        self.dateField.text = dateField.text
        self.view.endEditing(true)
    }
    
    @objc func donePressed() {
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = .medium
        dateFormatter.timeStyle = .none

        self.dateField.text = dateFormatter.string(from: datePicker.date)
        self.view.endEditing(true)
    }
}

// SetupTextField
extension InformationView {
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        
        let maxLength = 30
        let currentString: NSString = textField.text! as NSString
        let newString: NSString = currentString.replacingCharacters(in: range, with: string) as NSString
        
        if newString.length == maxLength {
            textField.resignFirstResponder()
        }
        return newString.length <= maxLength
    }
}
