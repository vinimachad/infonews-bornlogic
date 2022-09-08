//
//  NewsRoute.swift
//  InfoNews
//
//  Created by Vinicius Galhardo Machado on 08/09/22.
//

import Foundation

protocol NewsRouteProtocol {
    func getNews(completion: APIResult)
}

class NewsRoute {
    
    enum Target: APITargetProtocol {
        case everything
    }
    
    private var provider = APIProvider<Target>()
}

extension NewsRoute: NewsRouteProtocol {
    
    func getNews(completion: APIResult) {
        provider.request(.everything, completion: completion)
    }
}
