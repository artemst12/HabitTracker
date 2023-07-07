//
//  CustomTextFieldValidator.swift
//  HabitTracker
//
//  Created by Артем Ступников on 06.07.2023.
//

import UIKit

final class TextFieldValidator: NSObject, DefaultValidator {

    enum State {
        case success
        case failure
    }

    init(currentState: State = .failure) {
        self.currentState = currentState
    }

    var currentState: State

    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {

        guard let text = textField.text as? NSString else {
            return true
        }

        let maxLength = 30
        let currentString: NSString = text
        let newString: NSString = currentString.replacingCharacters(in: range, with: string) as NSString

        if newString.length == maxLength {
            textField.resignFirstResponder()
        }

        currentState = newString.length > 0 ? .success : .failure

        return newString.length <= maxLength
    }
}
