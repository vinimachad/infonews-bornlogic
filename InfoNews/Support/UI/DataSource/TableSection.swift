//
//  TableSection.swift
//  InfoNews
//
//  Created by Vinicius Galhardo Machado on 08/09/22.
//

import Foundation
import UIKit

protocol TableSectionDelegate: AnyObject {
    func didSelect(at: Int, item: CellViewModelProtocol)
}

class TableSection<T: UITableViewCell & CellProtocol>: TableSectionProtocol {
    
    // MARK: - Private properties
    
    private var viewModels: [T.ViewModel]
    private weak var delegate: TableSectionDelegate?
    
    // MARK: - Init
    
    init(viewModels: [T.ViewModel], delegate: TableSectionDelegate? = nil) {
        self.viewModels = viewModels
        self.delegate = delegate
    }
    
    var itemsCount: Int {
        viewModels.count
    }
    
    var cellIdentifier: String {
        String(describing: T.self)
    }
    
    var cellType: UITableViewCell.Type {
        T.self
    }
    
    func bindCell(cell: UITableViewCell, at row: Int) {
        if let cell = cell as? T, row < itemsCount {
            cell.bindIn(viewModel: viewModels[row])
        }
    }
    
    func didSelect(at: Int) {
        guard let item = viewModels[at] as? CellViewModelProtocol else { return }
        delegate?.didSelect(at: at,item: item)
    }
}

// MARK: - TableSectionDelegate

extension TableSectionDelegate {
    
    func didSelect(at: Int, item: CellViewModelProtocol) { }
}
