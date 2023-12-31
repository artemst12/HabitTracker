//
//  NewHabitInteractor.swift
//  HabitTracker
//
//  Created by Артем Ступников on 03.11.2023.
//

import UIKit

final class NewHabitInteractor {
     
    weak var output: NewHabitInteractorOutput?
    
    private var newHabitItems: [NewHabitStruct] = [
        .init(emoji: "health", name: "Health", add: false),
        .init(emoji: "arts", name: "Arts", add: false),
        .init(emoji: "sport", name: "Sport", add: false),
        .init(emoji: "skill development", name: "Skills Development", add: false),
        .init(emoji: "language", name: "Language", add: false),
        .init(emoji: "mindfulness", name: "Mindfulness", add: false),
    ]
}

extension NewHabitInteractor: NewHabitInteractorInput {

    func loadData() -> [NewHabitStruct] {
        return newHabitItems
    }

//    updateView() {
//        let model = ...
//        model.isCompleted = newHabitItems.contains(where: { $0.add == true })
//        loadData(with: model)
//    }
}

struct NewHabitStruct {
    let emoji: String
    let name: String
    let add: Bool
}
