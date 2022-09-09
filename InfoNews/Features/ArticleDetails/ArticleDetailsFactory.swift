//
//  ArticleDetailsFactory.swift
//  InfoNews
//
//  Created by Vinicius Galhardo Machado on 09/09/22.
//

import Foundation
import UIKit

enum ArticleDetailsFactory: ControllerFactoryProtocol {
    
    static func createController(delegate: ControllerDelegate?) -> UIViewController {
        let viewModel = ArticleDetailsViewModel()
        return ArticleDetailsController(viewModel: viewModel)
    }
}
