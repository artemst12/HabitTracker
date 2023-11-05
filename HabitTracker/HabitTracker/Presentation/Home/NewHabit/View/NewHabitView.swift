//
//  NewHabitView.swift
//  HabitTracker
//
//  Created by Артем Ступников on 03.11.2023.
//

import UIKit

final class NewHabitView: UIViewController {
    
    var output: NewHabitViewOutput?
    
    private var NewHabitTableView = UITableView()
    private var newHabitTableViewAdapter: NewHabitTableViewAdapter?
    
    private var doneButton = CustomButton()
//    private var backButtonItem: UIImage?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
}

extension NewHabitView: NewHabitViewInput {
    
    func updateView(data: [NewHabitStruct]) {
        newHabitTableViewAdapter?.set(data: data)
        newHabitTableViewAdapter?.reload()
    }
}

private extension NewHabitView {
    
    func setupUI() {
        setupView()
        setupTableView()
        setupButton()
        setupConstraints()
    }
    
    func setupView() {
        view.backgroundColor = Colors.background
        
        let backButtonItem = UIImage(named: "backButton")
//        self.navigationItem.leftBarButtonItem = UIBarButtonItem(
//            image: UIImage(named: "backButton"),
//            style: .plain,
//            target: self,
//            action: nil)
//        self.navigationItem/*.leftBarButtonItem = UIBarButtonItem(image: backButtonItem, title: "Add new habit", style: .plain, target: self, action: #*/selector(backButtonTapped))
        self.navigationItem.leftBarButtonItem = UIBarButtonItem(title: "Add new habit", image: backButtonItem, primaryAction: .init(handler: { action in
            self.backButtonTapped()
        }))
                                                                
        
//        self.navigationController?.navigationBar.prefersLargeTitles = true
//        self.navigationItem.largeTitleDisplayMode = .always
        self.navigationController?.navigationBar.backItem?.hidesBackButton = true
//        self.navigationController?.navigationBar.backIndicatorImage = backButtonItem
//        self.navigationController?.navigationBar.backIndicatorTransitionMaskImage = backButtonItem
//        self.navigationController?.navigationBar.backItem?.title = "Add new habit"
//        self.navigationController?.navigationItem.leftBarButtonItem =
    }
    
    @objc func backButtonTapped() {
        output?.backButtonTapped()
    }
    
    func setupTableView() {
        view.addSubview(NewHabitTableView)
        NewHabitTableView.translatesAutoresizingMaskIntoConstraints = false
        
        let items = output?.getItems() ?? []
        newHabitTableViewAdapter = NewHabitTableViewAdapter(tableView: NewHabitTableView, data: items)
    }
    
    func setupButton() {
        view.addSubview(doneButton)
        doneButton.setTitle("Done".localized(), for: .normal)
        doneButton.addAction(.init(handler: { [weak self] action in
            self?.output?.backButtonTapped()
        }), for: .touchUpInside)
        doneButton.isEnabled = false
        doneButton.backgroundColor = Colors.lightGreen
        doneButton.setTitleColor(.black, for: .normal)
    }
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            NewHabitTableView.topAnchor.constraint(equalTo: view.topAnchor),
            NewHabitTableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            NewHabitTableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            NewHabitTableView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            
            doneButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -40),
            doneButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 25),
            doneButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -25),
            doneButton.heightAnchor.constraint(equalToConstant: 55)
        ])
    }
}
