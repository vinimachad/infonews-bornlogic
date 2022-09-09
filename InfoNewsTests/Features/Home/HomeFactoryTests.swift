//
//  HomeFactory.swift
//  InfoNewsTests
//
//  Created by Vinicius Galhardo Machado on 08/09/22.
//

import Foundation
@testable import InfoNews
import XCTest

class HomeFactoryTests: XCTestCase {
    
    func test_createController_whenIsCalled_expectedReturnHomeController() {
        XCTAssertTrue(HomeFactory.createController(delegate: nil) is HomeController<HomeViewModel>)
    }
}
