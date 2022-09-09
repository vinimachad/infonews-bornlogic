//
//  HomeTableViewCellBuilder.swift
//  InfoNews
//
//  Created by Vinicius Galhardo Machado on 08/09/22.
//

import Foundation

protocol HomeTableViewCellBuilderProtocol: TableViewCellBuilderProtocol {
    func appendNewsSection(with news: [Article], onSelect: Completion<Article>, delegate: TableSectionDelegate?)
}

class HomeTableViewCellBuilder: HomeTableViewCellBuilderProtocol {
    
    // MARK: - Private properties
    
    private var builders: [TableSectionProtocol] = []
    
    // MARK: - Sections
    
    func appendNewsSection(with news: [Article], onSelect: Completion<Article>, delegate: TableSectionDelegate?) {
        let items = news.map {
            NewsCellViewModel(
                title: $0.title,
                description: $0.description,
                author: $0.author,
                urlToImage: $0.urlToImage,
                onSelect: onSelect
            )
        }
        builders.append(TableSection<NewsCell>(viewModels: items, delegate: delegate))
    }
    
    
    // MARK: - Builder
    
    func builder() -> [TableSectionProtocol] {
        builders
    }
}
