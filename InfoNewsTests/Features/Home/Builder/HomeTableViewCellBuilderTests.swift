//
//  HomeTableViewCellBuilderTests.swift
//  InfoNewsTests
//
//  Created by Vinicius Galhardo Machado on 08/09/22.
//

import Foundation
import XCTest
@testable import InfoNews

class HomeTableViewCellBuilderTests: XCTestCase {
    
    var sut: HomeTableViewCellBuilder!
    
    override func setUp() {
        sut = HomeTableViewCellBuilder()
    }
    
    func test_appendNewsSection_whenAllValuesIsFilled_expectedAppenSectionInBuilder() {
        let articles = [Article.mock(), Article.mock()]
        sut.appendNewsSection(with: articles, onSelect: nil, delegate: nil)
        XCTAssertEqual(sut.builder().count, 1)
    }
}
