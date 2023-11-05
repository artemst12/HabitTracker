//
//  TodayInteractor.swift
//  HabitTracker
//
//  Created by Артем Ступников on 04.09.2023.
//

import Foundation
import UIKit

extension Date {
    func get(_ components: Calendar.Component..., calendar: Calendar = Calendar.current) -> DateComponents {
           return calendar.dateComponents(Set(components), from: self)
       }

       func get(_ component: Calendar.Component, calendar: Calendar = Calendar.current) -> Int {
           return calendar.component(component, from: self)
       }
}

final class TodayInteractor {

    weak var output: TodayInteractorOutput?
//    let date = Date()
//    let components = date.get(.day, .month, .year)

    private let calendarItems: [CalendarDayItem] = [
        .init(dayName: "Mon", dayNumber: "1", rating: .awful),
        .init(dayName: "Tue", dayNumber: "2", rating: .good),
        .init(dayName: "Wed", dayNumber: "3", rating: .sad),
        .init(dayName: "Tue", dayNumber: "2", rating: .good),
        .init(dayName: "Wed", dayNumber: "3", rating: .empty),
        .init(dayName: "Tue", dayNumber: "2", rating: .good),
        .init(dayName: "Wed", dayNumber: "3", rating: .empty),
        .init(dayName: "Tue", dayNumber: "2", rating: .good),
        .init(dayName: "Wed", dayNumber: "3", rating: .empty)
    ]

    private let oneStepHabbits: [OneStepHabit] = [
        .init(emoji: "cake", name: "Avoid sweets", done: false),
        .init(emoji: "plant", name: "Plant-based diet", done: true),
        .init(emoji: "workout", name: "Work out for 30 min", done: true),
        .init(emoji: "breathe", name: "Breathe exercise", done: false)
    ]
    
    private let multiStepHabits: [MultiStepHabit] = [
        .init(image: .image("water"), habitLabel: "Water", label: "glass", countLabel: "5/10", minusButton: "minus", plusButton: "plus", done: true),
        .init(image: .emoji("😴"), habitLabel: "Sleep", label: "hours", countLabel: "5/8", minusButton: "minus", plusButton: "plus", done: false)
    ]
}

extension TodayInteractor: TodayInteractorInput {

    func loadData() {
        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
            // load from database
            let model = TodayViewModel()
            model.calendarItems = self.calendarItems
            model.oneStepHabbitSection = self.oneStepHabbits
            model.multiStepHabitSection = self.multiStepHabits
            self.output?.dataLoaded(model: model)
        }
    }
}

class TodayViewModel {

    var calendarItems: [CalendarDayItem] = []
    var oneStepHabbitSection: [OneStepHabit] = []
    var multiStepHabitSection: [MultiStepHabit] = []

    init() { }
}

struct CalendarDayItem {
    let dayName: String
    let dayNumber: String
    let rating: DayStatus
}

struct OneStepHabit {
    let emoji: String
    let name: String
    let done: Bool
}

enum MultiStepHabitImageType {
    case image(String)
    case emoji(String)
}

struct MultiStepHabit {
    let image: MultiStepHabitImageType
    let habitLabel: String
    let label: String
    let countLabel: String
    let minusButton: String
    let plusButton: String
    let done: Bool
}
