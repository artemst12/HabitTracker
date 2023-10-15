//
//  User.swift
//  HabitTracker
//
//  Created by Pavel Marinchenko on 17.09.2023.
//

import RealmSwift
import UIKit

class UserObject: Object {
    @Persisted(primaryKey: true) var _id: ObjectId
    @Persisted var name: String?
    @Persisted var gender: String?
    @Persisted var birthday: Date?
    @Persisted var createdAt: Date?

    convenience init(name: String, gender: String, birthday: Date) {
        self.init()
        self.name = name
        self.gender = gender
        self.birthday = birthday
        self.createdAt = Date()
    }
}

class OneStepHabitObject: Object {
    @Persisted(primaryKey: true) var _id: ObjectId
    @Persisted var emoji: String?
    @Persisted var name: String?
    @Persisted var done: Bool?
    @Persisted var createdAt: Date?

    convenience init(emoji: String, gender: String, done: Bool) {
        self.init()
        self.emoji = emoji
        self.name = name
        self.done = done
        self.createdAt = Date()
    }
}

class MultiStepHabitObject: Object {
    @Persisted(primaryKey: true) var _id: ObjectId
    @Persisted var emoji: String?
    @Persisted var name: String?
    @Persisted var doneCount: Int?
    @Persisted var goalCount: Int?
    @Persisted var hint: String?

    @Persisted var createdAt: Date?

    convenience init(
        emoji: String,
        name: String,
        doneCount: Int,
        goalCount: Int,
        hint: String
    ) {
        self.init()
        self.emoji = emoji
        self.name = name
        self.doneCount = doneCount
        self.goalCount = goalCount
        self.hint = hint
        self.createdAt = Date()
    }
}

class CalendarObject: Object {
    @Persisted(primaryKey: true) var _id: ObjectId
    @Persisted var days: List<CalendarDayObject>

    convenience init(days: [CalendarDayObject] = []) {
        self.init()
        self.days = .init()
    }
}


enum DayStatus: String, PersistableEnum {
    case good
    case sad
    case awful = "awful"
    case empty
}

class CalendarDayObject: Object {

    @Persisted(primaryKey: true) var _id: ObjectId
    @Persisted var status: DayStatus

    convenience init(status: DayStatus) {
        self.init()
        self.status = status
    }
}
