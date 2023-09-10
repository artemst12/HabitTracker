//
//  CustomTextFieldValidator.swift
//  HabitTracker
//
//  Created by Артем Ступников on 06.07.2023.
//

import UIKit
import Combine

final class TextFieldValidator: NSObject, DefaultValidator {

    enum State {
        case success
        case failure
    }

    enum Constants {
        static let maxCount = 30
    }

    var currentState: State
    var didUpdateBlock: (() -> Void)? = nil

    weak var textfield: UITextField?

    private var cancellable: Set<AnyCancellable> = []

    init(
        textfield: UITextField?,
        didUpdateBlock: (() -> Void)? = nil
    ) {
        self.textfield = textfield
        self.currentState = .failure
        self.didUpdateBlock = didUpdateBlock

        super.init()

        self.configureTextFieldValidation()
    }

    private func configureTextFieldValidation() {

        textfield?.addTarget(self, action: #selector(valueChanged), for: .valueChanged)

        textfield?.publisher(for: \.text)
            .sink(receiveValue: { text in
                self.valueChanged()
            })
            .store(in: &cancellable)
    }

    @objc
    func valueChanged() {
        let isValid = checkValidation(textField: textfield, for: textfield?.text)

        currentState = isValid ? .success : .failure

        didUpdateBlock?()
    }

    private func checkValidation(textField: UITextField?, for text: String?) -> Bool {
        guard let text else { return false }

        if text.count == Constants.maxCount {
            textField?.resignFirstResponder()
        }

        let isValid = text.count <= Constants.maxCount && text.count > 0

        return isValid
    }
}

extension TextFieldValidator: UITextFieldDelegate {

    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {

        guard let text = textField.text as? NSString else {
            return false
        }

        let newString = text.replacingCharacters(in: range, with: string)

        let isValid = checkValidation(textField: textField, for: newString)
        currentState = isValid ? .success : .failure
        didUpdateBlock?()

        return text.length <= Constants.maxCount
    }
}
