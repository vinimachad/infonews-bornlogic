//
//  HomeViewModel.swift
//  InfoNews
//
//  Created by Vinicius Galhardo Machado on 08/09/22.
//

import Foundation


protocol HomeProtocol: HomeViewModelProtocol {
    var onTapArticle: ((Article) -> Void)? { get set }
    var onFailureGetNews: ((String) -> Void)? { get set }
    func getNewsRequest()
}

class HomeViewModel: ArticleSender {
    
    // MARK: - Public properties
    
    var onChangeSections: (([TableSectionProtocol]) -> Void)?
    var onFailureGetNews: ((String) -> Void)?
    var onTapArticle: ((Article) -> Void)?
    
    // MARK: - Private properties
    
    private lazy var sectionBuilder: HomeTableViewCellBuilderProtocol = HomeTableViewCellBuilder()
    private var getNewsUseCase: GetNewsUseCaseProtocol
    private var articles: [Article] = []
    
    // MARK: - Init
    
    init(getNewsUseCase: GetNewsUseCaseProtocol) {
        self.getNewsUseCase = getNewsUseCase
    }
    
    private func didSelectArticle(_ article: Article) {
        onTapArticle?(article)
        sendArticle(article)
    }
}

// MARK: - HomeProtocol

extension HomeViewModel: HomeProtocol {    
    
    func getNewsRequest() {
        
        getNewsUseCase.execute(
            success: { [weak self] news in
                self?.articles = news.articles
                self?.sectionBuilder.appendNewsSection(
                    with: news.articles,
                    onSelect: self?.didSelectArticle(_:),
                    delegate: self
                )
                self?.onChangeSections?(self?.sectionBuilder.builder() ?? [])
            },
            failure: { [weak self] error in
                self?.onFailureGetNews?(error.localizedDescription)
            }
        )
    }
}

extension HomeViewModel: TableSectionDelegate {
    
    func didSelect(at: Int, item: CellViewModelProtocol) {
        guard let viewModel = item as? NewsCellViewModelProtocol else { return }

        viewModel.didSelect(article: articles[at])
    }
}
