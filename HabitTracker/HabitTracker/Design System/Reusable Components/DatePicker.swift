//
//  DatePicker.swift
//  HabitTracker
//
//  Created by Артем Ступников on 28.06.2023.
//

import UIKit

final class DatePicker: UIDatePicker {
    
    enum Corners {
        static let raduisDatePicker: CGFloat = 20
    }

    private weak var textfield: UITextField?

    override init(frame: CGRect) {
        super.init(frame: frame)
        self.translatesAutoresizingMaskIntoConstraints = false
        setupUI()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func set(textfield: UITextField?) {
        textfield?.inputView = self
        textfield?.inputAccessoryView = createToolbar()
        self.textfield = textfield
    }
}

extension DatePicker {

    func setupUI() {
        createDatepicker()
    }

    func createDatepicker() {
        self.preferredDatePickerStyle = .wheels
        self.datePickerMode = .date
        self.backgroundColor = Colors.lightBlack
    }

    func createToolbar() -> UIToolbar {
        // toolbar
        let toolbar = UIToolbar()
        toolbar.sizeToFit()
        toolbar.layer.cornerRadius = Corners.raduisDatePicker
        toolbar.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
        toolbar.clipsToBounds = true
        toolbar.barTintColor = Colors.dark

        let space = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: self, action: nil)
        let cancelButton = UIBarButtonItem(barButtonSystemItem: .stop, target: self, action: #selector(cancel))
        cancelButton.tintColor = Colors.white

        // done button
        let doneBtn = UIBarButtonItem(barButtonSystemItem: .save, target: nil, action: #selector(donePressed))
        doneBtn.tintColor = Colors.white
        toolbar.setItems([cancelButton, space, doneBtn], animated: true)

        return toolbar
    }

    @objc func cancel() {
        textfield?.resignFirstResponder()
    }

    @objc func donePressed() {
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = .medium
        dateFormatter.timeStyle = .none

        self.textfield?.text = dateFormatter.string(from: date)
        self.textfield?.resignFirstResponder()
    }
}
