//
//  NewHabitOutput.swift
//  HabitTracker
//
//  Created by Артем Ступников on 03.11.2023.
//

import Foundation

protocol NewHabitViewOutput {
    
    func getItems() -> [NewHabitStruct]
    func backButtonTapped()
}
