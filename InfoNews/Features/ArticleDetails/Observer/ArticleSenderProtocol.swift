//
//  ArticleSenderProtocol.swift
//  InfoNews
//
//  Created by Vinicius Galhardo Machado on 09/09/22.
//

import Foundation

protocol ArticleSender {
    func sendArticle(_ article: Article)
}

extension ArticleSender {
    
    func sendArticle(_ article: Article) {
        NotificationCenter.default.post(name: Notification.Name("article-key"), object: article)
    }
}
