//
//  TypeAlias.swift
//  InfoNews
//
//  Created by Vinicius Galhardo Machado on 08/09/22.
//

import Foundation

typealias Completion<T: Any> = ((T) -> Void)?
typealias APIResult = Completion<Result<Data, Error>>
