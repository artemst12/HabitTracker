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
        .init(image: .image("water"), habitLabel: "Water", label: "glass", currentCount: 6, maxCount: 10, minusButton: "minus", plusButton: "plus", done: true),
        .init(image: .emoji("😴"), habitLabel: "Sleep", label: "hours", currentCount: 7, maxCount: 10, minusButton: "minus", plusButton: "plus", done: false)
    ]
    
    private var multi: [MultiStepHabit] = []
}

extension TodayInteractor: TodayInteractorInput {

    func loadData() {
        self.multi = self.multiStepHabits
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
            // load from database
            self.updateState()
        }
    }
    
    func changeData(id: UUID, type: TodayInteractorMultistepAction) {
        guard let waterHabit = multi.filter({ $0.id == id }).first else {
            return
        }
        
//        let maxCount = waterHabit.maxCount
//        let counters = waterHabit.countLabel.split(separator: "/")
        
        switch type {
        case .minus:
            if waterHabit.currentCount > 0 {
                waterHabit.currentCount -= 1
            }
            // waterHabit.currentCount = max(0, waterHabit.currentCount - 1)
        case .plus:
            if waterHabit.currentCount < 10 {
                waterHabit.currentCount += 1
            }
//             waterHabit.currentCount = min(waterHabit.maxCount, waterHabit.currentCount + 1)
            return
        }
        
        updateState()
    }
    
    func updateState() {
        let model = TodayViewModel()
        model.calendarItems = self.calendarItems
        model.oneStepHabbitSection = self.oneStepHabbits
        model.multiStepHabitSection = self.multi
        
        self.output?.dataLoaded(model: model)
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

final class MultiStepHabit {
    let id: UUID = .init()
    let image: MultiStepHabitImageType
    let habitLabel: String
    let label: String
    
    var countLabel: String {
        return "\(currentCount)/\(maxCount)"
    }
    
    var currentCount: Int
    let maxCount: Int
    
    let minusButton: String
    let plusButton: String
    let done: Bool
    
    init(image: MultiStepHabitImageType, habitLabel: String, label: String, currentCount: Int, maxCount: Int, minusButton: String, plusButton: String, done: Bool) {
        self.image = image
        self.habitLabel = habitLabel
        self.label = label
        self.currentCount = currentCount
        self.maxCount = maxCount
        self.minusButton = minusButton
        self.plusButton = plusButton
        self.done = done
    }
}
