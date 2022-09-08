//
//  HomeView.swift
//  InfoNews
//
//  Created by Vinicius Galhardo Machado on 08/09/22.
//

import Foundation
import UIKit
import SnapKit

protocol HomeViewModelProtocol {
    var onChangeSections: Completion<[TableSectionProtocol]>? { get set }
}

class HomeView: UIView {
    
    // MARK: - UI Components
    
    private lazy var tableView = UITableView()
    
    // MARK: - Private properties
    
    private var viewModel: HomeViewModelProtocol?
    private var tableViewDataSource = TableViewDataSource()
    
    // MARK: Init
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Bind
    
    func bindIn(viewModel: HomeViewModelProtocol) {
        self.viewModel = viewModel
        
        self.viewModel?.onChangeSections = { [weak self] sections in
            self?.tableViewDataSource.sections = sections
        }
    }
}

// MARK: - Setup view

extension HomeView {
    
    private func setup() {
        setupConstraints()
        setupTableView()
    }
    
    private func setupTableView() {
        tableViewDataSource.tableView = tableView
    }
}

// MARK: - Setup constraints

extension HomeView {
    
    private func setupConstraints() {
        viewHierarchy()
        
        tableView.snp.makeConstraints {
            $0.edges.equalTo(snp.edges)
        }
    }
    
    private func viewHierarchy() {
        addSubview(tableView)
    }
}

