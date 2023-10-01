//
//  TodayTableViewAdapter.swift
//  HabitTracker
//
//  Created by Артем Ступников on 19.09.2023.
//

import UIKit

final class TodayTableViewAdapter: NSObject {
    
    private var tableView: UITableView?
    
    init(tableView: UITableView? = nil) {
        self.tableView = tableView
    }
}
