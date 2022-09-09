//
//  ArticleDetailsView.swift
//  InfoNews
//
//  Created by Vinicius Galhardo Machado on 09/09/22.
//

import Foundation

import UIKit
import SnapKit

protocol ArticleDetailsViewModelProtocol {
    var urlToImage: String? { get }
    var title: String? { get }
    var content: String? { get }
    var publishedFormattedDate: String? { get }
}

class ArticleDetailsView: UIView {
    
    // MARK: - UI Components
    
    private lazy var coverImageView = UIImageView()
    private lazy var separatorView = UIView()
    private lazy var titleLabel = UILabel()
    private lazy var publishedDate = UILabel()
    private lazy var contentLabel = UILabel()
    
    // MARK: - Private properties
    
    private var viewModel: ArticleDetailsViewModelProtocol?
    
    // MARK: Init
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Bind
    
    func bindIn(viewModel: ArticleDetailsViewModelProtocol) {
        self.viewModel = viewModel
        
        coverImageView.imageBy(urlString: viewModel.urlToImage ?? "")
        titleLabel.text = viewModel.title
        publishedDate.text = "Published at - " + (viewModel.publishedFormattedDate ?? "")
        contentLabel.text = viewModel.content
    }
}

// MARK: - Setup view

extension ArticleDetailsView {
    
    private func setup() {
        setupConstraints()
        setupCoverImageView()
        setupSeparatorView()
        setupTitleLabel()
        setupPublishedDate()
        setupContentLabel()
        backgroundColor = .systemBackground
    }
    
    private func setupCoverImageView() {
        coverImageView.contentMode = .scaleAspectFill
        coverImageView.clipsToBounds = true
        coverImageView.layer.cornerRadius = 8
    }
    
    private func setupSeparatorView() {
        separatorView.backgroundColor = .separator
    }
    
    private func setupTitleLabel() {
        titleLabel.font = .systemFont(ofSize: 16, weight: .bold)
        titleLabel.numberOfLines = 0
        titleLabel.textColor = .label
    }
    
    private func setupPublishedDate() {
        publishedDate.font = .systemFont(ofSize: 13, weight: .medium)
        publishedDate.numberOfLines = 0
        publishedDate.textColor = .secondaryLabel
    }
    
    private func setupContentLabel() {
        contentLabel.font = .systemFont(ofSize: 13, weight: .regular)
        contentLabel.numberOfLines = 0
        contentLabel.textAlignment = .justified
        contentLabel.textColor = .label
    }
}

// MARK: - Setup constraints

extension ArticleDetailsView {
    
    private func setupConstraints() {
        viewHierarchy()
        
        coverImageView.snp.makeConstraints {
            $0.top.equalTo(snp.topMargin)
            $0.horizontalEdges.equalTo(snp.horizontalEdges)
            $0.height.equalTo(200)
        }
        
        separatorView.snp.makeConstraints {
            $0.top.equalTo(coverImageView.snp.bottom).offset(32)
            $0.horizontalEdges.equalTo(snp.horizontalEdges)
            $0.height.equalTo(1)
        }
        
        titleLabel.snp.makeConstraints {
            $0.top.equalTo(separatorView.snp.bottom).offset(32)
            $0.horizontalEdges.equalTo(snp.horizontalEdges)
        }
        
        publishedDate.snp.makeConstraints {
            $0.top.equalTo(titleLabel.snp.bottom).offset(4)
            $0.horizontalEdges.equalTo(snp.horizontalEdges)
        }
        
        contentLabel.snp.makeConstraints {
            $0.top.equalTo(publishedDate.snp.bottom).offset(24)
            $0.horizontalEdges.equalTo(snp.horizontalEdges)
            $0.bottom.lessThanOrEqualTo(snp.bottom)
        }
    }
    
    private func viewHierarchy() {
        addSubview(coverImageView)
        addSubview(separatorView)
        addSubview(titleLabel)
        addSubview(publishedDate)
        addSubview(contentLabel)
    }
}

