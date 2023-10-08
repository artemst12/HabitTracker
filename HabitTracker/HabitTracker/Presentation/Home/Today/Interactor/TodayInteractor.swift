//
//  TodayInteractor.swift
//  HabitTracker
//
//  Created by Артем Ступников on 04.09.2023.
//

import Foundation

final class TodayInteractor {

    weak var output: TodayInteractorOutput?

    private let calendarItems: [CalendarDayItem] = [
        .init(dayName: "Mon", dayNumber: "1", rating: .awful),
        .init(dayName: "Tue", dayNumber: "2", rating: .good),
        .init(dayName: "Wed", dayNumber: "3", rating: .empty),
        .init(dayName: "Tue", dayNumber: "2", rating: .good),
        .init(dayName: "Wed", dayNumber: "3", rating: .empty),
        .init(dayName: "Tue", dayNumber: "2", rating: .good),
        .init(dayName: "Wed", dayNumber: "3", rating: .empty),
        .init(dayName: "Tue", dayNumber: "2", rating: .good),
        .init(dayName: "Wed", dayNumber: "3", rating: .empty)
    ]

    private let oneStepHabbits: [OneStepHabit] = [
        .init(emoji: "😁", name: "Laugh", done: false)
    ]
}

extension TodayInteractor: TodayInteractorInput {

    func loadData() {
        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
            // load from database
            let model = TodayViewModel()
            model.calendarItems = self.calendarItems
            model.oneStepHabbitSection = self.oneStepHabbits
            self.output?.dataLoaded(model: model)
        }
    }
}

class TodayViewModel {

    var calendarItems: [CalendarDayItem] = []
    var oneStepHabbitSection: [OneStepHabit] = []

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
