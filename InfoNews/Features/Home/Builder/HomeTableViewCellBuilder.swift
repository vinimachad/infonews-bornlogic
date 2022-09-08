//
//  HomeTableViewCellBuilder.swift
//  InfoNews
//
//  Created by Vinicius Galhardo Machado on 08/09/22.
//

import Foundation

protocol HomeTableViewCellBuilderProtocol: TableViewCellBuilderProtocol {
    func appendNewsSection(with news: [Article])
}

class HomeTableViewCellBuilder: HomeTableViewCellBuilderProtocol {
    
    // MARK: - Private properties
    
    private var builders: [TableSectionProtocol] = []
    
    // MARK: - Sections
    
    func appendNewsSection(with news: [Article]) {
        let items = news.map {
            NewsCellViewModel(title: $0.title, description: $0.description, author: $0.author, urlToImage: $0.urlToImage)
        }
        builders.append(TableSection<NewsCell>(viewModels: items, delegate: nil))
    }
    
    // MARK: - Builder
    
    func builder() -> [TableSectionProtocol] {
        builders
    }
}
