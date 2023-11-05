//
//  NewHabitTableViewAdapter.swift
//  HabitTracker
//
//  Created by Артем Ступников on 03.11.2023.
//

import UIKit

final class NewHabitTableViewAdapter: NSObject {
    
    private let tableView: UITableView
    
    private var data: [NewHabitStruct] = []
    
    init(tableView: UITableView? = nil, data: [NewHabitStruct]) {
        self.tableView = tableView!
        self.data = data
        super.init()
        
        self.tableView.dataSource = self
        self.tableView.delegate = self
        
        tableView?.register(NewHabitTableCell.self, forCellReuseIdentifier: NewHabitTableCell.reuseIdentifier)
    }
}

extension NewHabitTableViewAdapter {
    
    func set(data: [NewHabitStruct]) {
        self.data = data
    }
    
    func reload() {
        tableView.reloadData()
    }
}

extension NewHabitTableViewAdapter: UITableViewDataSource, UITableViewDelegate {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return data.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "NewHabitTableCell") as? NewHabitTableCell else {
            return UITableViewCell()
        }
        let currentItem = data[indexPath.section]
        
        cell.configure(picture: currentItem.emoji, label: currentItem.name, button: currentItem.add)
    
        return cell
    }
    
}
