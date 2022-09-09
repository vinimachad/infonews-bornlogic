//
//  HomeController.swift
//  InfoNewsTests
//
//  Created by Vinicius Galhardo Machado on 08/09/22.
//

import Foundation
import XCTest
@testable import InfoNews

class HomeControllerTests: XCTestCase {
    
    var sut: HomeController<HomeViewModelMock>!
    var viewModelMock: HomeViewModelMock!
    var delegateMock: HomeControllerDelegateMock!
    
    override func setUp() {
        viewModelMock = HomeViewModelMock()
        delegateMock = HomeControllerDelegateMock()
        sut = HomeController(viewModel: viewModelMock, delegate: delegateMock)
        
        let window = UIWindow(frame: UIScreen.main.bounds)
        window.rootViewController = UINavigationController(rootViewController: sut)
        window.makeKeyAndVisible()
        
        _ = sut.view
        
    }
    
    func test_bind_whenViewModelInvokeOnTapArticle_expectedInvokePushArticleDetails() {
        viewModelMock.onTapArticle?()
        XCTAssertEqual(delegateMock.invokedPushArticleDetailsCount, 1)
    }
}

