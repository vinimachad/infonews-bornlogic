//
//  GetNewsUseCaseTests.swift
//  InfoNewsTests
//
//  Created by Vinicius Galhardo Machado on 08/09/22.
//

import Foundation
@testable import InfoNews
import XCTest

class GetNewsUseCaseTests: XCTestCase {
    
    var sut: GetNewsUseCase!
    var apiMock: NewsRouteMock!
    
    override func setUp(){
        apiMock = NewsRouteMock()
        sut = GetNewsUseCase(api: apiMock)
    }
    
    func test_execute_whenApiReturnSuccess_expectedAllValuesIsEqualToExpected() {
        var expected = News(articles: [Article(title: "teste", description: "description", author: "author", urlToImage: "urlToImage")])
        var news: News?
        
        let dictData = [
            "articles": [
                Article.toDict()
            ],
        ]
        
        let jsonData = try? JSONSerialization.data(withJSONObject: dictData, options: .prettyPrinted)
        apiMock.data = jsonData
        
        self.sut.execute(
            success: { value in
                news = value
                XCTAssertEqual(news?.articles[0].title, expected.articles[0].title)
                XCTAssertEqual(news?.articles[0].author, expected.articles[0].author)
                XCTAssertEqual(news?.articles[0].description, expected.articles[0].description)
                XCTAssertEqual(news?.articles[0].urlToImage, expected.articles[0].urlToImage)
            },
            failure: nil
        )

    }
    
    func test_execute_whenApiReturnFailure_expectedErrorMessageIsEqualToExpected() {
        var expected = NSError(domain: "Error", code: 0)
    
        apiMock.error = NSError(domain: "Error", code: 0)
        
        self.sut.execute(
            success: nil,
            failure: { message in
                XCTAssertEqual(message.localizedDescription, expected.localizedDescription)
            }
        )

    }
}
