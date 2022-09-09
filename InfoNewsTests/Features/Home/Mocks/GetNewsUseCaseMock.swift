//
//  GetNewsUseCaseMock.swift
//  InfoNewsTests
//
//  Created by Vinicius Galhardo Machado on 08/09/22.
//

import Foundation
@testable import InfoNews

class GetNewsUseCaseMock: GetNewsUseCaseProtocol {
    var invokedExecuteCount = 0
    
    var error: Error?
    var news: News?
    
    func execute(success: Completion<News>, failure: Completion<Error>) {
        
        invokedExecuteCount += 1
        
        if let error = error {
            failure?(error)
        }
        
        if let news = news {
            success?(news)
        }
    }
}
