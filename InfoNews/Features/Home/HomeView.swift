//
//  HomeView.swift
//  InfoNews
//
//  Created by Vinicius Galhardo Machado on 08/09/22.
//

import Foundation
import UIKit
import SnapKit

protocol HomeViewModelProtocol {}

class HomeView: UIView {
    
    // MARK: - UI Components
    
    private lazy var tableView = UITableView()
    
    // MARK: - Private properties
    
    private var viewModel: HomeViewModelProtocol?
    
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
    }
}

// MARK: - Setup view

extension HomeView {
    
    private func setup() {
        setupConstraints()
        tableView.backgroundColor = .red
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

