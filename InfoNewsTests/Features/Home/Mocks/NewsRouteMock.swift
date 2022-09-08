//
//  NewsRouteMock.swift
//  InfoNewsTests
//
//  Created by Vinicius Galhardo Machado on 08/09/22.
//

import Foundation
@testable import InfoNews

class NewsRouteMock: NewsRouteProtocol {
    
    var invokedGetNewsCount = 0
    
    var data: Data?
    var error: Error?
    
    func getNews(completion: APIResult) {
        invokedGetNewsCount += 1
        
        if let data = data {
            completion?(.success(data))
        }
        
        if let error = error {
            completion?(.failure(error))
        }
    }
}
