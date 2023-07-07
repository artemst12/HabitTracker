//
//  Extension + String.swift
//  HabitTracker
//
//  Created by Артем Ступников on 05.07.2023.
//

import Foundation

extension String {
    func localized() -> String {
        NSLocalizedString(
            self,
            tableName: "Localizable",
            bundle: .main,
            value: self,
            comment: self
        )
    }
}
