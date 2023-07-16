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

    var currentState: State
    var didUpdateBlock: (() -> Void)? = nil

    // weak var textfield: UITextField

    init(currentState: State = .failure, didUpdateBlock: (() -> Void)? = nil) {
        self.currentState = currentState
        self.didUpdateBlock = didUpdateBlock
    }
}

extension TextFieldValidator: UITextFieldDelegate {

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

        didUpdateBlock?()

        return newString.length <= maxLength
    }
}
