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

    private var scrollView = UIScrollView()
    private var contentView = UIView()
    
    private let historyScreens = StackScreenView()

    private var nameField = CustomTextField()
    private var dateField = CustomTextField()
    
    private let skipButton = UIButton()
    
    private let datePicker = DatePicker()
    
    private let nextButton = CustomButton()

    // MARK: Constraints
    private var scrollViewBottomConstraint: NSLayoutConstraint?
    private var nextButtonBottomConstraint: NSLayoutConstraint?
    
    private lazy var regex = "^(?=.*[а-я)(?=.*[А-Я])(?=.*\\d)(?=.[$@$!%*?&#])[А-Яа-я\\d$@$!%*?&#]"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        removeObservers()
    }
}

// MARK: InformationViewInput
extension InformationView: InformationViewInput {
}

// MARK: Methods
 extension InformationView {

     func setupUI() {
        setupView()
        setupScrollView()
        setupLabels()
        setupTextFields()
        setupSkipButton()
        setupButtons()
        createDatepicker()
        setupObservers()
        setupConstraints()
    }
     
     func setupView() {
         view.backgroundColor = Colors.background
         self.navigationItem.hidesBackButton = true
         
         view.addSubview(historyScreens)
         historyScreens.setScreenColor(welcomeColor: .white, informationColor: .white, genderColor: .darkGray, congratsColor: .darkGray)
    }

    func setupScrollView() {
        view.addSubview(scrollView)
        scrollView.contentInset = .init(top: 0, left: 0, bottom: 100, right: 0)
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        scrollView.keyboardDismissMode = .onDrag

        scrollView.addSubview(contentView)
        scrollView.alwaysBounceVertical = true
        contentView.translatesAutoresizingMaskIntoConstraints = false
    }
    
    func setupLabels() {
        titleLabel.text = "Fill your information!".localized()
        contentView.addSubview(titleLabel)
        
        enterNameLabel.text = "Enter your name".localized()
        contentView.addSubview(enterNameLabel)
        
        enterDateLabel.text = "Enter your date of birth".localized()
        contentView.addSubview(enterDateLabel)
    }
    
    func setupTextFields() {
        contentView.addSubview(nameField)
        contentView.addSubview(dateField)

        let textDidChanged: () -> Void = {
            let isInvalid = [self.nameField, self.dateField]
                .map { $0.isValid } // [true, false].contains(false) == true
                .contains(false)

            self.nextButton.isUserInteractionEnabled = !isInvalid
            self.nextButton.backgroundColor = isInvalid ? Colors.lightBlack : Colors.lightGreen
            self.nextButton.titleLabel?.textColor = isInvalid ? .white : .darkText
        }

        nameField.set(
            delegate: TextFieldValidator(textfield: nameField, didUpdateBlock: textDidChanged)
        )
        dateField.set(
            delegate: TextFieldValidator(textfield: dateField, didUpdateBlock: textDidChanged)
        )

        nameField.setLeftPaddingPoints(10)
        nameField.setRightPaddingPoints(10)
        
        dateField.setLeftPaddingPoints(10)
        dateField.setRightPaddingPoints(10)
        }

     func createDatepicker() {
         datePicker.preferredDatePickerStyle = .wheels
         datePicker.datePickerMode = .date
         datePicker.setValue(Colors.darkBlack, forKeyPath: "textColor")
         datePicker.set(textfield: dateField)
     }
     
     func setupSkipButton() {
         view.addSubview(skipButton)
         skipButton.translatesAutoresizingMaskIntoConstraints = false
         skipButton.setTitle("Skip", for: .normal)
         skipButton.setTitleColor(.lightGray, for: .normal)
         skipButton.titleLabel?.font = .systemFont(ofSize: 16)
         skipButton.backgroundColor = .clear
         
         skipButton.addAction(.init(handler: { [weak self] action in
             self?.output?.nextButtonTapped()
         }), for: .touchUpInside)
     }
     
     func setupButtons() {
         nextButton.setTitle("Next".localized(), for: .normal)
         nextButton.addAction(.init(handler: { [weak self] action in
             self?.output?.nextButtonTapped()
         }), for: .touchUpInside)
         view.addSubview(nextButton)
     }

     func setupObservers() {
         NotificationCenter.default
             .addObserver(
                self,
                selector: #selector(self.keyboardWillShow),
                name: UIResponder.keyboardWillShowNotification,
                object: nil)
         NotificationCenter.default
             .addObserver(
                self,
                selector: #selector(self.keyboardWillHide),
                name: UIResponder.keyboardWillHideNotification,
                object: nil)
     }

     func removeObservers() {
         NotificationCenter.default.removeObserver(self,
                                                   name: UIResponder.keyboardWillShowNotification,
                                                   object: nil)
         NotificationCenter.default.removeObserver(self,
                                                   name: UIResponder.keyboardWillHideNotification,
                                                   object: nil)
     }

     @objc func keyboardWillShow(notification: Notification) {
         let keyboardSize = (notification.userInfo? [UIResponder.keyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue
         let keyboardHeight = keyboardSize?.height

         self.scrollViewBottomConstraint?.constant = -(keyboardHeight! - view.safeAreaInsets.bottom)
         self.nextButtonBottomConstraint?.constant = -(keyboardHeight! - view.safeAreaInsets.bottom + 40)

         UIView.animate(withDuration: 0.5) {
             self.view.layoutIfNeeded()
         }
     }

     @objc func keyboardWillHide(notification: Notification) {

        self.scrollViewBottomConstraint?.constant = view.safeAreaInsets.bottom
        self.nextButtonBottomConstraint?.constant = -40

        UIView.animate(withDuration: 0.5) {
            self.view.layoutIfNeeded()
        }
    }

    func setupConstraints() {
        let hContentView = contentView.heightAnchor.constraint(equalTo: scrollView.heightAnchor)
        hContentView.priority = .init(rawValue: 250)

        let scrollViewBottomConstraint = scrollView.bottomAnchor
            .constraint(equalTo: view.bottomAnchor, constant: 0)

        let nextButtonBottomConstraint = nextButton.bottomAnchor
            .constraint(equalTo: view.bottomAnchor, constant: -40)

        self.scrollViewBottomConstraint = scrollViewBottomConstraint
        self.nextButtonBottomConstraint = nextButtonBottomConstraint

        NSLayoutConstraint.activate([
            scrollView.topAnchor.constraint(equalTo: view.topAnchor),
            scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            scrollViewBottomConstraint,

            contentView.topAnchor.constraint(equalTo: scrollView.topAnchor),
            contentView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor),
            contentView.trailingAnchor.constraint(equalTo:scrollView.trailingAnchor),
            hContentView,
            
            historyScreens.topAnchor.constraint(equalTo: view.topAnchor, constant: 70),
            historyScreens.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),
            historyScreens.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30),

            titleLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 150),
            titleLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            titleLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 30),
            titleLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -30),
            
            enterNameLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 50),
            enterNameLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 25),
            
            nameField.topAnchor.constraint(equalTo: enterNameLabel.bottomAnchor, constant: 15),
            nameField.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 25),
            nameField.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -25),
            nameField.heightAnchor.constraint(equalToConstant: 50),
            
            enterDateLabel.topAnchor.constraint(equalTo: nameField.bottomAnchor, constant: 30),
            enterDateLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 25),
            
            skipButton.topAnchor.constraint(equalTo: view.topAnchor, constant: 100),
            skipButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30),
            
            dateField.topAnchor.constraint(equalTo: enterDateLabel.bottomAnchor, constant: 15),
            dateField.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 25),
            dateField.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -25),
            dateField.heightAnchor.constraint(equalToConstant: 50),

            nextButtonBottomConstraint,
            nextButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 25),
            nextButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -25),
            nextButton.heightAnchor.constraint(equalToConstant: 55)
        ])
    }
}

// TODO: Скрытие клавиатуры +
// TODO: Скрытие кнопки назад +
// TODO: Отступы слева и справа у поля ввода (?) +
// TODO: Нет отслеживания состояния заполненности полей
// TODO: Цвета вынести в отдельные enum в дизайн систему +
// TODO: Date Picker в отдельный компонент +
