//
//  ResultItemData.swift
//  SearchComponent
//
//  Created by saminos on 30/04/24.
//

import Foundation

struct ResultItemData: Hashable {
    let key: String = UUID().uuidString
    let value: String
    
    public static func == (lhs: ResultItemData, rhs: ResultItemData) -> Bool {
        return lhs.key == rhs.key
    }
}
