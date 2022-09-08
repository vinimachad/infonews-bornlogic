//
//  HomeFactory.swift
//  InfoNews
//
//  Created by Vinicius Galhardo Machado on 08/09/22.
//

import Foundation
import UIKit

enum HomeFactory: ControllerFactoryProtocol {
    
    static func createController() -> UIViewController {
        let viewModel = HomeViewModel()
        return HomeController(viewModel: viewModel)
    }
}
