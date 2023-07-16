//
//  Enums.swift
//  HabitTracker
//
//  Created by Артем Ступников on 04.07.2023.
//

import UIKit

// TODO: абстрактные названия для переменных
enum Fonts {
    static let titleSize: CGFloat = 32
    static let descriptionSize: CGFloat = 14
    static let buttonTitle: CGFloat = 18
    static let emojiSize: CGFloat = 72
    static let buttonLabelSize: CGFloat = 18
}

enum Colors {
    static let lightGreen = UIColor.init(red: 178/255, green: 240/255, blue: 66/255, alpha: 1)
    static let lightBlack = UIColor.init(red: 25/255, green: 25/255, blue: 25/255, alpha: 1)
    static let dark = UIColor.init(red: 6/255, green: 6/255, blue: 6/255, alpha: 1)
    static let darkBlack = UIColor.init(red: 210/255, green: 210/255, blue: 210/255, alpha: 1)
    static let white = UIColor.white
    static let lightGray = UIColor.lightGray
    static let background = UIColor.init(red: 16/255, green: 16/255, blue: 16/255, alpha: 1)
}

enum Constants {
    static let radiusTextField: CGFloat = 12
    static let cornerRadiusNextButton: CGFloat = 14
    static let cornerRadiusGenderButton: CGFloat = 16
}

enum Weigth {
    static let bold = UIFont.Weight.bold
    static let medium = UIFont.Weight.medium
}
