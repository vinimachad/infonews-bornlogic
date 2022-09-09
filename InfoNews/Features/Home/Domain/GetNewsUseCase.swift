//
//  GetNewsUseCase.swift
//  InfoNews
//
//  Created by Vinicius Galhardo Machado on 08/09/22.
//

import Foundation

protocol GetNewsUseCaseProtocol {
    func execute(success: Completion<News>, failure: Completion<Error>)
}

class GetNewsUseCase: GetNewsUseCaseProtocol {
    
    // MARK: - Private properties
    
    let api: NewsRouteProtocol
    
    // MARK: - Init
    
    init(api: NewsRouteProtocol) {
        self.api = api
    }
    
    func execute(success: Completion<News>, failure: Completion<Error>) {
        
        DispatchQueue.global().async {
            
            self.api.getNews { result in
                
                DispatchQueue.main.async {
                    switch result {
                    case .success(let data):
                        do {
                            let news = try data.decode(type: News.self)
                            success?(news)
                        } catch let error {
                            failure?(error)
                        }
                    case .failure(let error):
                        failure?(error)
                    }
                }
            }
        }
    }
}
