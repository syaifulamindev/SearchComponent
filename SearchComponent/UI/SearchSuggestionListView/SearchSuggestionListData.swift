//
//  SearchSuggestionListData.swift
//  SearchComponent
//
//  Created by saminos on 01/05/24.
//

import Foundation

struct SearchSuggestionListData: Hashable {
    let key: String = UUID().uuidString
    var list: [SearchSuggestionData]
    init(_ categories: [String]) {
        
        list = categories.enumerated().map { index, value in
            SearchSuggestionData(index: index, value: value)
        }
        
    }
    
    public static func == (lhs: SearchSuggestionListData, rhs: SearchSuggestionListData) -> Bool {
        return lhs.key == rhs.key
    }
}
