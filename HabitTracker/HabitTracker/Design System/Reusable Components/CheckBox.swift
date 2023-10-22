//
//  CheckBox.swift
//  HabitTracker
//
//  Created by Артем Ступников on 20.10.2023.
//

import UIKit

class CheckBox: UIButton {
    
    let doneImage = UIImage(named: "done")
    let undoneImage = UIImage(named: "undone")
    
    var isDone: Bool = false {
        didSet {
            if isDone == true {
                self.setImage(doneImage, for: .normal)
            } else {
                self.setImage(undoneImage, for: .normal)
            }
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.translatesAutoresizingMaskIntoConstraints = false
        self.addTarget(self, action:#selector(buttonClicked(sender:)), for: .touchUpInside)
        self.isDone = false
        self.contentMode = .scaleAspectFit
    }
    
    @objc func buttonClicked(sender: UIButton) {
        if sender == self {
            isDone = !isDone
        }
    }
}
