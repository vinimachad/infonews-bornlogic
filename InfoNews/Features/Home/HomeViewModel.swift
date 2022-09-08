//
//  HomeViewModel.swift
//  InfoNews
//
//  Created by Vinicius Galhardo Machado on 08/09/22.
//

import Foundation


protocol HomeProtocol: HomeViewModelProtocol {
    func teste()
}

class HomeViewModel {
    
    // MARK: - Public properties
    
    var onChangeSections: Completion<[TableSectionProtocol]>?
    
    // MARK: - Private properties
    
    private lazy var sectionBuilder: HomeTableViewCellBuilderProtocol = HomeTableViewCellBuilder()
    
    // MARK: - Init
    
    init() {
        
    }
    
    func teste() {
        let new = News(title: "Toronto Film Festival: Awards season begins as Hollywood stars arrive", description: "A Knives Out sequel and a Harry Styles romance drama are among the highlights this year.", author: "BBC News", urlToImage: "teste")
        sectionBuilder.appendNewsSection(with: [new])
        onChangeSections?(sectionBuilder.builder())
    }
}

// MARK: - HomeProtocol

extension HomeViewModel: HomeProtocol {
    
}
