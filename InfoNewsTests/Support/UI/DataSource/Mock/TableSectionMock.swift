//
//  TableSectionMock.swift
//  InfoNewsTests
//
//  Created by Vinicius Galhardo Machado on 08/09/22.
//

import UIKit
@testable import InfoNews

class TableSectionMock: TableSectionProtocol {
    
    var invokedBindCellCount = 0
    var invokedDidSelectRowCount = 0
    
    var itemsCount: Int = 0
    var cellType: UITableViewCell.Type = TableViewCellMock.self
    var cellIdentifier: String = String(describing: TableViewCellMock.self)
    
    func bindCell(cell: UITableViewCell, at row: Int) {
        invokedBindCellCount += 1
    }
    
    func didSelectAt(row: Int) {
        invokedDidSelectRowCount += 1
    }
}
