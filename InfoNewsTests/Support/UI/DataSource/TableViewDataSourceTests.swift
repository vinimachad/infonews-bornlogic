//
//  TableViewDataSourceTests.swift
//  InfoNewsTests
//
//  Created by Vinicius Galhardo Machado on 08/09/22.
//

import Foundation
import XCTest
@testable import InfoNews

class TableViewDataSourceTests: XCTestCase {
    
    var tableView: UITableView!
    var sut: TableViewDataSource!
    
    override func setUp() {
        tableView = UITableView()
        sut = TableViewDataSource()
        
        sut.tableView = tableView
    }
    
    func test_tableView_whenIsNotNil_expectTableViewDataSourceAndDelegateAsSut() {
        XCTAssertNotNil(tableView.delegate)
        XCTAssertNotNil(tableView.dataSource)
        
        XCTAssertTrue(sut.tableView?.delegate is TableViewDataSource)
        XCTAssertTrue(sut.tableView?.dataSource is TableViewDataSource)
    }
    
    func test_numberOfRowsInSection_whenSectionIs0_expectEqualNumberOfItemsInSection() {
        let section = TableSectionMock()
        section.itemsCount = 2
        
        sut.sections = [section]
        
        XCTAssertEqual(sut.tableView(tableView, numberOfRowsInSection: 0), section.itemsCount)
    }
    
    func test_cellForRow_whenHasOneSectionAndSelectFirstRowInSection_expectInvokeBindCellInSection() {
        let section = TableSectionMock()
        section.cellType = TableViewCellMock.self
        
        sut.sections = [section]
        
        _ = sut.tableView(tableView, cellForRowAt: IndexPath(row: 0, section: 0))
        
        XCTAssertEqual(section.invokedBindCellCount, 1)
    }
}
