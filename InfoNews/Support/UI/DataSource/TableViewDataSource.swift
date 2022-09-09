//
//  TableViewDataSource.swift
//  InfoNews
//
//  Created by Vinicius Galhardo Machado on 08/09/22.
//

import Foundation
import UIKit

class TableViewDataSource: NSObject, UITableViewDataSource, UITableViewDelegate {
    
    // MARK: - Public properties
    
    var tableView: UITableView? {
        didSet {
            tableView?.delegate = self
            tableView?.dataSource = self
            register()
        }
    }
    
    var sections: [TableSectionProtocol] = [] {
        didSet {
            tableView?.reloadData()
            register()
        }
    }
    
    private func register() {
        sections.forEach {
            tableView?.register($0.cellType, forCellReuseIdentifier: $0.cellIdentifier)
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if sections.isEmpty {
            return 0
        }
        return sections[section].itemsCount
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let section = sections[indexPath.section]
        let cell = tableView.dequeueReusableCell(withIdentifier: section.cellIdentifier, for: indexPath)
        
        section.bindCell(cell: cell, at: indexPath.row)
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        sections[indexPath.section].didSelect(at: indexPath.row)
    }
}
