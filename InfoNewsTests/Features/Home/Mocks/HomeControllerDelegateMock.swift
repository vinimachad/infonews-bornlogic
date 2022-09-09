//
//  HomeControllerDelegateMock.swift
//  InfoNewsTests
//
//  Created by Vinicius Galhardo Machado on 08/09/22.
//

import Foundation
@testable import InfoNews

class HomeControllerDelegateMock: HomeControllerDelegate {
    
    var invokedPushArticleDetailsCount = 0
    
    func pushArticleDetails() {
        invokedPushArticleDetailsCount += 1
    }
}

