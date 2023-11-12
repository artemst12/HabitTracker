//
//  TodayViewOutput.swift
//  HabitTracker
//
//  Created by Артем Ступников on 04.09.2023.
//

import Foundation

protocol TodayViewOutput: AnyObject {
    
    func requestData()
    func newHabitButtonTapped()
    func statsButtonTapped()
    func calendarButtonTapped()
    func minusCount(id: UUID)
    func plusCount(id: UUID)
}
