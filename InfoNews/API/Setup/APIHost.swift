//
//  APIHost.swift
//  InfoNews
//
//  Created by Vinicius Galhardo Machado on 08/09/22.
//

import Foundation

enum APIHost {
    
    static var baseURL: URL {
        let urlString: String = "https://newsapi.org/v2/everything?q=iOS"
        
        guard let url = URL(string: urlString) else { fatalError("URL não suportada") }
        return url
    }
}
