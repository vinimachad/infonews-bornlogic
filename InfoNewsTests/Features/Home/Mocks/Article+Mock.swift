//
//  Article+Mock.swift
//  InfoNewsTests
//
//  Created by Vinicius Galhardo Machado on 08/09/22.
//

import Foundation
@testable import InfoNews

extension Article {
    
    static func mock() -> Article {
        Article(title: "teste", description: "description", author: "author", urlToImage: "urlToImage", publishedAt: "2022-09-09T17:44:18Z", content: "content")
    }
    
    static func toDictMock() -> [String: String] {
        ["title": "teste",
         "description": "description",
         "author": "author",
         "urlToImage": "urlToImage",
         "publishedAt": "2022-09-09T17:44:18Z"
        ]
    }
}
