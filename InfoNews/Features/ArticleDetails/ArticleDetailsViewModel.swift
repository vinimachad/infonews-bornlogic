//
//  ArticleDetailsViewModel.swift
//  InfoNews
//
//  Created by Vinicius Galhardo Machado on 09/09/22.
//

import Foundation


protocol ArticleDetailsProtocol: ArticleDetailsViewModelProtocol {}

class ArticleDetailsViewModel: ArticleDetailsProtocol, ArticleObserver {
    
    // MARK: - Public properties
    
    var urlToImage: String?
    var title: String?
    var content: String?
    var publishedFormattedDate: String?
    
    // MARK: - Init
    
    init() { observeArticle(#selector(didUpdateValues)) }
    
    // MARK: - Updates
    
    @objc private func didUpdateValues(notification: NSNotification) {
        guard let article = notification.object as? Article else { return }
        urlToImage = article.urlToImage
        title = article.title
        content = article.content
        publishedFormattedDate = article.publishedAt.formatToDate()
    }
}
