//
//  CreateHabitOutput.swift
//  HabitTracker
//
//  Created by Артем Ступников on 14.11.2023.
//

import Foundation

protocol CreateHabitViewOutput: AnyObject {
    
    func backButtonTapped()
    func createNewButtonTapped()
    func repeatsTapped()
    func remindersTapped()
}
