//
//  NewsCellViewModel.swift
//  InfoNews
//
//  Created by Vinicius Galhardo Machado on 08/09/22.
//

import Foundation

struct NewsCellViewModel: NewsCellViewModelProtocol {
    var title: String
    var description: String
    var author: String?
    var urlToImage: String
    var onSelect: Completion<Article>
    
    func didSelect(article: Article) {
        onSelect?(article)
    }
}
