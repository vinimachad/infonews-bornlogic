//
//  AppCoordinatorTests.swift
//  InfoNewsTests
//
//  Created by Vinicius Galhardo Machado on 08/09/22.
//

import Foundation
@testable import InfoNews
import XCTest

class AppCoordinatorTests: XCTestCase {
    
    var sut: AppCoordinator!
    var window: UIWindow!
    
    override func setUp() {
        self.window = UIWindow()
        self.sut = AppCoordinator(window: window)
    }
    
    func test_start_whenStartIsCalled_expectedChildCoordinatorIsHomeCoordinator() {
        sut.start()
        XCTAssertTrue(sut.childCoordinator is HomeCoordinator)
    }
}
