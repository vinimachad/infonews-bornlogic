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
        Article(title: "Title", description: "Description", author: "Author", urlToImage: "UrlToImage")
    }
    
    static func toDict() -> [String: String] {
        ["title": "teste",
         "description": "description",
         "author": "author",
         "urlToImage": "urlToImage"]
    }
}
