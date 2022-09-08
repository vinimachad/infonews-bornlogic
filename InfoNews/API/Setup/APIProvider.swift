//
//  APIProvider.swift
//  InfoNews
//
//  Created by Vinicius Galhardo Machado on 08/09/22.
//

import Foundation

class APIProvider<T: APITargetProtocol> {
    
    func request(_ target: T, completion: APIResult) {
        
        var request = URLRequest(url: target.baseUrl)
        setHeaders(&request, header: target.headers)
        let task = URLSession.shared.dataTask(with: request) { (data, response, error) in
            if let error = error {
                completion?(.failure(error))
                return
            }
            guard let data = data else { return }
            completion?(.success(data))
        }

        task.resume()
    }
    
    private func setHeaders(_ request: inout URLRequest, header: [String: String]?) {
        header?.keys.forEach {
            request.setValue(header?[$0], forHTTPHeaderField: $0)
        }
    }
}
