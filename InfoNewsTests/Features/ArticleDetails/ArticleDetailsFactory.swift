//
//  ArticleDetailsFactory.swift
//  InfoNewsTests
//
//  Created by Vinicius Galhardo Machado on 09/09/22.
//

import Foundation
@testable import InfoNews
import XCTest

class ArticleDetailsFactoryTests: XCTestCase {
    
    func test_createController_whenIsCalled_expectedReturnArticleDetailsController() {
        XCTAssertTrue(ArticleDetailsFactory.createController(delegate: nil) is ArticleDetailsController<ArticleDetailsViewModel>)
    }
}
