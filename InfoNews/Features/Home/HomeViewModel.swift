//
//  HomeViewModel.swift
//  InfoNews
//
//  Created by Vinicius Galhardo Machado on 08/09/22.
//

import Foundation


protocol HomeProtocol: HomeViewModelProtocol {
    func getNewsRequest()
}

class HomeViewModel {
    
    // MARK: - Public properties
    
    var onChangeSections: (([TableSectionProtocol]) -> Void)?
    
    // MARK: - Private properties
    
    private lazy var sectionBuilder: HomeTableViewCellBuilderProtocol = HomeTableViewCellBuilder()
    private var getNewsUseCase: GetNewsUseCaseProtocol
    
    // MARK: - Init
    
    init(getNewsUseCase: GetNewsUseCaseProtocol) {
        self.getNewsUseCase = getNewsUseCase
    }
    
}

// MARK: - HomeProtocol

extension HomeViewModel: HomeProtocol {    
    
    func getNewsRequest() {
        getNewsUseCase.execute(
            success: { [weak self] news in
                self?.sectionBuilder.appendNewsSection(with: news.articles)
                self?.onChangeSections?(self?.sectionBuilder.builder() ?? [])
            },
            failure: { [weak self] error in
                print(error)
            }
        )
    }
}
