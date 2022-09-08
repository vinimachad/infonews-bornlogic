//
//  HomeFactory.swift
//  InfoNews
//
//  Created by Vinicius Galhardo Machado on 08/09/22.
//

import Foundation
import UIKit

enum HomeFactory: ControllerFactoryProtocol {
    
    static func createController(delegate: HomeControllerDelegate?) -> UIViewController {
        let useCase = GetNewsUseCase(api: NewsRoute())
        let viewModel = HomeViewModel(getNewsUseCase: useCase)
        return HomeController(viewModel: viewModel, delegate: delegate)
    }
}
