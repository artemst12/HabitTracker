//
//  CheckBox.swift
//  HabitTracker
//
//  Created by Артем Ступников on 20.10.2023.
//

import UIKit

final class CheckBox: UIButton {

    private var doneImage: UIImage?
    private var undoneImage: UIImage?
    private(set) var isDone: Bool = false

    private var action: ((Bool) -> Void)?

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func set(done: String, undone: String) {
        self.doneImage = .init(named: done)
        self.undoneImage = .init(named: undone)
    }

    func set(action: @escaping (Bool) -> Void) {
        self.action = action
    }

    func set(state enabled: Bool) {
        self.isDone = enabled

        if enabled {
            self.setImage(doneImage, for: .normal)
        } else {
            self.setImage(undoneImage, for: .normal)
        }
    }

    override init(frame: CGRect) {
        super.init(frame: frame)
        self.translatesAutoresizingMaskIntoConstraints = false
        self.addTarget(self, action:#selector(buttonClicked(sender:)), for: .touchUpInside)

        self.contentMode = .scaleAspectFit
    }
    


    @objc
    private func buttonClicked(sender: UIButton) {
        if sender == self {
            set(state: !isDone)
            action?(isDone)
        }
    }
}
