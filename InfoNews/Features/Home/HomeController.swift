//
//  HomeController.swift
//  InfoNews
//
//  Created by Vinicius Galhardo Machado on 08/09/22.
//

import Foundation
import UIKit

protocol HomeControllerDelegate: ControllerDelegate {
    func pushArticleDetails(with article: Article)
}

class HomeController<ViewModel: HomeProtocol>: UIViewController {
    
    // MARK: - Private properties
    
    private let contentView: HomeView
    private var viewModel: ViewModel
    private weak var delegate: HomeControllerDelegate?
    
    // MARK: - Init
    
    init(viewModel: ViewModel, delegate: HomeControllerDelegate?) {
        self.viewModel = viewModel
        self.delegate = delegate
        contentView = HomeView()
        super.init(nibName: nil, bundle: nil)
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Life cycle
    
    override func loadView() {
        super.loadView()
        view = contentView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        bind()
        viewModel.getNewsRequest()
    }
}

// MARK: - Bind

extension HomeController {
    
    private func bind() {
        contentView.bindIn(viewModel: viewModel)

        viewModel.onTapArticle = { [weak self] article in
            self?.delegate?.pushArticleDetails(with: article)
        }
    }
}
