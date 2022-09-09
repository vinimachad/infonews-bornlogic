//
//  ArticleObserver.swift
//  InfoNews
//
//  Created by Vinicius Galhardo Machado on 09/09/22.
//

import Foundation

protocol ArticleObserver {
    func observeArticle(_ action: Selector)
}

extension ArticleObserver {
    
    func observeArticle(_ action: Selector) {
        NotificationCenter.default.addObserver(self, selector: action, name: Notification.Name("article-key"), object: nil)
    }
}


