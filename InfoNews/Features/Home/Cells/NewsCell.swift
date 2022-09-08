//
//  NewsCell.swift
//  InfoNews
//
//  Created by Vinicius Galhardo Machado on 08/09/22.
//

import Foundation

import UIKit

protocol NewsCellViewModelProtocol: CellViewModelProtocol {
    var title: String { get }
    var description: String { get }
    var author: String { get }
    var urlToImage: String { get }
}

class NewsCell: UITableViewCell, CellProtocol {
    
    // MARK: - UI Components
    
    private lazy var coverImageView = UIImageView()
    private lazy var titleLabel = UILabel()
    private lazy var resumeLabel = UILabel()
    private lazy var authorsLabel = UILabel()
    
    // MARK: - Private properties
    
    private var viewModel: NewsCellViewModelProtocol?
    
    // MARK: Init
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setup()
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Bind
    
    func bindIn(viewModel: NewsCellViewModelProtocol) {
        self.viewModel = viewModel
        titleLabel.text = viewModel.title
        resumeLabel.text = viewModel.description
        authorsLabel.text = "by \(viewModel.author)"
        coverImageView.imageBy(urlString: viewModel.urlToImage)
    }
}

// MARK: - Setup view

extension NewsCell {
    
    private func setup() {
        setupConstraints()
        setupCoverImageView()
        setupTitleLabel()
        setupResumeLabel()
        setupAuthorsLabel()
    }
    
    private func setupCoverImageView() {
        coverImageView.contentMode = .scaleAspectFill
        coverImageView.clipsToBounds = true
    }
    
    private func setupTitleLabel() {
        titleLabel.font = .systemFont(ofSize: 13, weight: .bold)
        titleLabel.numberOfLines = 2
    }
    
    private func setupResumeLabel() {
        resumeLabel.font = .systemFont(ofSize: 13, weight: .regular)
        resumeLabel.numberOfLines = 2
    }
    
    private func setupAuthorsLabel() {
        authorsLabel.font = .systemFont(ofSize: 13, weight: .medium)
        authorsLabel.numberOfLines = 1
        authorsLabel.textAlignment = .right
    }
}

// MARK: - Setup constraints

extension NewsCell {
    
    private func setupConstraints() {
        viewHierarchy()
        
        coverImageView.snp.makeConstraints {
            $0.left.equalTo(contentView.snp.leftMargin)
            $0.centerY.equalTo(contentView.snp.centerY)
            $0.height.lessThanOrEqualTo(100)
            $0.width.equalTo(120)
        }
        
        titleLabel.snp.makeConstraints {
            $0.top.equalTo(contentView.snp.topMargin)
            $0.left.equalTo(coverImageView.snp.right).offset(10)
            $0.right.equalTo(contentView.snp.rightMargin)
        }
        
        resumeLabel.snp.makeConstraints {
            $0.left.equalTo(coverImageView.snp.right).offset(10)
            $0.top.equalTo(titleLabel.snp.bottom).offset(4)
            $0.right.equalTo(contentView.snp.rightMargin)
        }
        
        authorsLabel.snp.makeConstraints {
            $0.left.equalTo(coverImageView.snp.right).offset(10)
            $0.top.equalTo(resumeLabel.snp.bottom).offset(10)
            $0.right.equalTo(contentView.snp.rightMargin)
            $0.bottom.equalTo(contentView.snp.bottomMargin)
        }
    }
    
    private func viewHierarchy() {
        contentView.addSubview(coverImageView)
        contentView.addSubview(titleLabel)
        contentView.addSubview(resumeLabel)
        contentView.addSubview(authorsLabel)
    }
}
