//
//  ArticleDetailsController.swift
//  InfoNews
//
//  Created by Vinicius Galhardo Machado on 09/09/22.
//

import Foundation

import Foundation
import UIKit

class ArticleDetailsController<ViewModel: ArticleDetailsProtocol>: UIViewController {
    
    // MARK: - Private properties
    
    private let scrollView: ScrollView
    private let contentView: ArticleDetailsView
    private var viewModel: ViewModel
    
    // MARK: - Init
    
    init(viewModel: ViewModel) {
        self.viewModel = viewModel
        contentView = ArticleDetailsView()
        scrollView = ScrollView(contentView: contentView)
        super.init(nibName: nil, bundle: nil)
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Life cycle
    
    override func loadView() {
        super.loadView()
        view = scrollView
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        bind()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}

// MARK: - Bind

extension ArticleDetailsController {
    
    private func bind() {
        contentView.bindIn(viewModel: viewModel)
    }
}
