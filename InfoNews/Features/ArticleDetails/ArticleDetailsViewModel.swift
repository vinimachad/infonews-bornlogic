//
//  ArticleDetailsViewModel.swift
//  InfoNews
//
//  Created by Vinicius Galhardo Machado on 09/09/22.
//

import Foundation


protocol ArticleDetailsProtocol: ArticleDetailsViewModelProtocol {
    
}

class ArticleDetailsViewModel {
    
    // MARK: - Public properties
    
    var urlToImage: String?
    var title: String?
    var content: String?
    var publishedFormattedDate: String?
    
    // MARK: - Private properties
    
    // MARK: - Init
    
    init() {
        NotificationCenter.default.addObserver(self, selector: #selector(didUpdateValues), name: Notification.Name("article"), object: nil)
    }
    
    @objc private func didUpdateValues(notification: NSNotification) {
        guard let article = notification.object as? Article else { return }
        urlToImage = article.urlToImage
        title = article.title
        content = article.content
        publishedFormattedDate = article.publishedAt.formatToDate()
    }
}

// MARK: - ArticleDetailsProtocol

extension ArticleDetailsViewModel: ArticleDetailsProtocol {
    
}
