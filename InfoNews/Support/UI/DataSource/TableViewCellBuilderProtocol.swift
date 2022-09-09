//
//  TableViewCellBuilder.swift
//  InfoNews
//
//  Created by Vinicius Galhardo Machado on 08/09/22.
//

import Foundation

protocol TableViewCellBuilderProtocol {
    func builder() -> [TableSectionProtocol]
}
