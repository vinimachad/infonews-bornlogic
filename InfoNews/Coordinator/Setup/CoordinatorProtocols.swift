//
//  CoordinatorProtocols.swift
//  InfoNews
//
//  Created by Vinicius Galhardo Machado on 08/09/22.
//

import Foundation
import UIKit

protocol CoordinatorProtocol {
    var childCoordinator: CoordinatorProtocol? { get set }
    var containerViewController: UIViewController { get }
    func start() -> UIViewController
}
