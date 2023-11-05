//
//  NewHabitInteractorOutput.swift
//  HabitTracker
//
//  Created by Артем Ступников on 03.11.2023.
//

import Foundation

protocol NewHabitInteractorOutput: AnyObject {
    
    func updateView(_ data: [NewHabitStruct])
}
