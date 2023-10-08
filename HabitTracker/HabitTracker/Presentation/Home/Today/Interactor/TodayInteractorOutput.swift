//
//  TodayInteractorOutput.swift
//  HabitTracker
//
//  Created by Артем Ступников on 04.09.2023.
//

import Foundation

protocol TodayInteractorOutput: AnyObject {
    
    func dataLoaded(model: TodayViewModel)
}
