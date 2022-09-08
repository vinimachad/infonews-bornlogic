//
//  HomeControllerDelegateMock.swift
//  InfoNewsTests
//
//  Created by Vinicius Galhardo Machado on 08/09/22.
//

import Foundation
@testable import InfoNews

class HomeControllerDelegateMock: HomeControllerDelegate {
    
    var invokedPushArticleDetails = (article: Article.mock(), count: 0)
    
    func pushArticleDetails(with article: Article) {
        invokedPushArticleDetails.article = article
        invokedPushArticleDetails.count += 1
    }
}

