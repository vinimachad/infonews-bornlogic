//
//  HomeViewModelTests.swift
//  InfoNewsTests
//
//  Created by Vinicius Galhardo Machado on 08/09/22.
//

import Foundation
import XCTest
@testable import InfoNews

class HomeViewModelTests: XCTestCase {
    
    var sut: HomeViewModel!
    var getNewsUseCaseMock: GetNewsUseCaseMock!
    
    override func setUp() {
        getNewsUseCaseMock = GetNewsUseCaseMock()
        sut = HomeViewModel(getNewsUseCase: getNewsUseCaseMock)
    }
    
    func test_getNewsRequest_whenIsCalled_expectedExecuteIsInvoked() {
        sut.getNewsRequest()
        XCTAssertEqual(getNewsUseCaseMock.invokedExecuteCount, 1)
    }
    
    func test_getNewsRequest_whenHasFailureRequest_expectedInvokeOnFailureGetNews() {
        var onFailureGetNewsCount = 0
        
        sut.onFailureGetNews = { _ in
            onFailureGetNewsCount += 1
        }
        
        getNewsUseCaseMock.error = NSError(domain: "Erro", code: 0)
        sut.getNewsRequest()
        XCTAssertEqual(onFailureGetNewsCount, 1)
    }
    
    func test_getNewsRequest_whenHasSuccessRequest_expectedInvokeOnChangeSections() {
        var onChangeSectionsCount = 0
        
        sut.onChangeSections = { _ in
            onChangeSectionsCount += 1
        }
        
        getNewsUseCaseMock.news = News(articles: [Article.mock(), Article.mock()])
        sut.getNewsRequest()
        XCTAssertEqual(onChangeSectionsCount, 1)
    }
}
