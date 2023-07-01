//
//  GenderInteractor.swift
//  HabitTracker
//
//  Created by Артем Ступников on 29.06.2023.
//

import Foundation

final class GenderInteractor {
    
    weak var output: GenderInteractorOutput?
    
    private var items: [EmojiItems] = [
        .init(emoji: "🙂", genderLabel: "Male"),
        .init(emoji: "🥳", genderLabel: "Female")
    ]
}

extension GenderInteractor: GenderInteractorInput {
    
    func loadData() -> [EmojiItems] {
        return items
    }
}

