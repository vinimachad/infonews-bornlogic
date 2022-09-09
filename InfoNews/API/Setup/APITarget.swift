//
//  APITarget.swift
//  InfoNews
//
//  Created by Vinicius Galhardo Machado on 08/09/22.
//

import Foundation

protocol APITargetProtocol {
    var baseUrl: URL { get }
    var headers: [String: String]? { get }
}

extension APITargetProtocol {
    
    var baseUrl: URL {
        return APIHost.baseURL
    }
    
    var headers: [String: String]? {
        return authorizationHeader()
    }
    
    private func authorizationHeader() -> [String: String] {
        
        return [
            "Content-type": "application/json",
            "Authorization": "Bearer 952309fdafc749f0817a57d620e935ea"
        ]
    }
}
