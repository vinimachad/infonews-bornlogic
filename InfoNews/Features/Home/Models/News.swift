//
//  News.swift
//  InfoNews
//
//  Created by Vinicius Galhardo Machado on 08/09/22.
//

import Foundation

struct News: Decodable {
    var title: String
    var description: String
    var author: String
    var urlToImage: String
}
