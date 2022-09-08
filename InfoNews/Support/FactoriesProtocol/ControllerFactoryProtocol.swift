//
//  ControllerFactoryProtocol.swift
//  InfoNews
//
//  Created by Vinicius Galhardo Machado on 08/09/22.
//

import Foundation
import UIKit

protocol ControllerDelegate: AnyObject { }

protocol ControllerFactoryProtocol {
    associatedtype Delegate = ControllerDelegate
    static func createController(delegate: Delegate?) -> UIViewController
}
