//
//  HomeCoordinator.swift
//  InfoNews
//
//  Created by Vinicius Galhardo Machado on 08/09/22.
//

import Foundation
import UIKit

class HomeCoordinator: CoordinatorProtocol {
    
    // MARK: - Public properties
    
    var childCoordinator: CoordinatorProtocol?
    
    var containerViewController: UIViewController {
        navigationController
    }
    
    // MARK: - Private properties
    
    private var navigationController = UINavigationController()
    
    // MARK: - Start
    
    func start() -> UIViewController {
        let vc = HomeFactory.createController(delegate: self)
        navigationController.modalPresentationStyle = .fullScreen
        navigationController.setViewControllers([vc], animated: true)
        return navigationController
    }
}

extension HomeCoordinator: HomeControllerDelegate {
    
    func pushArticleDetails(with article: Article) {
        let controller = ArticleDetailsFactory.createController(delegate: nil)
        navigationController.pushViewController(controller, animated: true)
    }
}
