//
//  DatePicker.swift
//  HabitTracker
//
//  Created by Артем Ступников on 28.06.2023.
//

//import UIKit
//
//final class DatePicker: UIDatePicker {
//
//    override init(frame: CGRect) {
//        super.init(frame: frame)
//        self.translatesAutoresizingMaskIntoConstraints = false
//        setupUI()
//    }
//
//    required init?(coder: NSCoder) {
//        fatalError("init(coder:) has not been implemented")
//    }
//}
//
//extension DatePicker {
//
//    func setupUI() {
//        createDatepicker()
//    }
//
//    func createDatepicker() {
//        self.preferredDatePickerStyle = .wheels
//        self.datePickerMode = .date
//        self.backgroundColor = .init(red: 25/255, green: 25/255, blue: 25/255, alpha: 1)
//        self.setValue(UIColor.init(red: 210/255, green: 210/255, blue: 210/255, alpha: 1), forKeyPath: "textColor")
//    }
//
//    func createToolbar() -> UIToolbar {
//        // toolbar
//        let toolbar = UIToolbar()
//        toolbar.sizeToFit()
//        toolbar.layer.cornerRadius = 20
//        toolbar.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
//        toolbar.clipsToBounds = true
//        toolbar.barTintColor = .init(red: 8/255, green: 8/255, blue: 8/255, alpha: 1)
//
//        let space = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: self, action: nil)
//        let cancelButton = UIBarButtonItem(barButtonSystemItem: .stop, target: self, action: #selector(cancel))
//        cancelButton.tintColor = .white
//
//        // done button
//        let doneBtn = UIBarButtonItem(barButtonSystemItem: .save, target: nil, action: #selector(donePressed))
//        doneBtn.tintColor = .white
//        toolbar.setItems([cancelButton, space, doneBtn], animated: true)
//
//        return toolbar
//    }
//}
