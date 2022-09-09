//
//  HomeCoordinatorTests.swift
//  InfoNewsTests
//
//  Created by Vinicius Galhardo Machado on 08/09/22.
//

import Foundation
import XCTest
@testable import InfoNews

class HomeCoordinatorTests: XCTestCase {
    
    var sut: HomeCoordinator!
    
    override func setUp() {
        self.sut = HomeCoordinator()
    }
    
    func test_start_whenStartIsCalled_expectedNavigationControllerIsEqualToHomeController() {
        _ = sut.start()
        let result = sut.containerViewController as! UINavigationController
        XCTAssertTrue(result.topViewController is HomeController<HomeViewModel>)
    }
    
    func test_pushArticleDetails_whenIsCalled_expectedChildCoordinatorIsEqualToArticleDetailsController() {
        sut.pushArticleDetails()
        let controller = sut.navigationController.topViewController
        XCTAssertTrue(controller is ArticleDetailsController<ArticleDetailsViewModel>)
    }
}
