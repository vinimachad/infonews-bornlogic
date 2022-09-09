//
//  TableViewCellMock.swift
//  InfoNewsTests
//
//  Created by Vinicius Galhardo Machado on 08/09/22.
//

import UIKit
@testable import InfoNews

protocol TableViewCellMockViewModelProtocol { }

class TableViewCellMock: UITableViewCell {
    
    func bindIn(viewModel: TableViewCellMockViewModelProtocol) {  }
}
