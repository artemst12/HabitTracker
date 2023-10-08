//
//  TodayViewInput.swift
//  HabitTracker
//
//  Created by Артем Ступников on 04.09.2023.
//

import Foundation

protocol TodayViewInput: AnyObject {
 
    func updateView(with model: TodayViewModel)

}
