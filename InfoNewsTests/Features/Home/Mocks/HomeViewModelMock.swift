//
//  HomeViewModelMock.swift
//  InfoNewsTests
//
//  Created by Vinicius Galhardo Machado on 08/09/22.
//

import Foundation
@testable import InfoNews

class HomeViewModelMock: HomeProtocol {
    
    var invokedGetNewsRequestCount = 0
    
    var onTapArticle: ((Article) -> Void)?
    var onChangeSections: (([TableSectionProtocol]) -> Void)?
    var onFailureGetNews: ((String) -> Void)?
    
    func getNewsRequest() {
        invokedGetNewsRequestCount += 1
    }
}
