//
//  TableSectionProtocol.swift
//  InfoNews
//
//  Created by Vinicius Galhardo Machado on 08/09/22.
//

import Foundation
import UIKit

protocol TableSectionProtocol {
    var itemsCount: Int { get }
    var cellType: UITableViewCell.Type { get }
    var cellIdentifier: String { get }
    func bindCell(cell: UITableViewCell, at row: Int)
    func didSelect(at: Int)
}

extension TableSectionProtocol {
    func didSelect(at: Int) { }
}

protocol CellProtocol {
    associatedtype ViewModel = CellViewModelProtocol
    func bindIn(viewModel: ViewModel)
}

protocol CellViewModelProtocol {
    var cellIdentifier: String { get }
}
