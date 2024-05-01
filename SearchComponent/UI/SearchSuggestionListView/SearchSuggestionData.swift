//
//  SearchSuggestionData.swift
//  SearchComponent
//
//  Created by saminos on 30/04/24.
//

import Foundation

struct SearchSuggestionData: Hashable {
    let key: String = UUID().uuidString
    let index: Int
    let value: String
    
//    public static func == (lhs: SearchSuggestionData, rhs: SearchSuggestionData) -> Bool {
//        return lhs.key == rhs.key
//    }
    
    public static func == (lhs: SearchSuggestionData, rhs: SearchSuggestionData) -> Bool {
        return lhs.key == rhs.key
    }
}
