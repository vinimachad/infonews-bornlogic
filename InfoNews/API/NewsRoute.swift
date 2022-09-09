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
        case news
    }
    
    private var provider = APIProvider<Target>()
}

extension NewsRoute: NewsRouteProtocol {
    
    func getNews(completion: APIResult) {
        provider.request(.news, completion: completion)
    }
}
