//
//  SearchData.swift
//  SearchComponent
//
//  Created by saminos on 30/04/24.
//
import Foundation

struct SearchData: Equatable, ExpressibleByStringInterpolation {
    
    var glob: String = "glob" {
        didSet {
            let categories = readCategory()
            if categories.count > 0 {
                value = .category(SearchSuggestionListData(categories))
            } else if glob.count != 0 {
                value = .title(glob)
            } else {
                value = .none
            }
        }
    }
    
    private let categoryPrefix = "@"
    
    
    var value: SearchValue = .none
    
    
    init(glob: String) {
        self.glob = glob
    }
    
    init(stringLiteral value: String) {
        self.init(glob: value)
//        self.glob = value
    }
    
    static func ==(a: SearchData, b: SearchData) -> Bool {
        a.glob == b.glob
    }
    
    // MARK: read category
    func removeWrongComponentsSplit(categories: inout [String]) {
        if categories.first?.first == "@" {
            categories.removeFirst()
        } else if glob.first != "@" {
            categories.removeFirst()
        }
    }
    
    func firstComponentRange(before lastIndex: String.Index? = nil) -> ClosedRange<String.Index> {
        glob.index(after:glob.startIndex)...glob.index(before: lastIndex ?? glob.endIndex)
    }
    
    func globContainAtAndMoreThanOneChar() -> Bool {
        glob.first == "@" && glob.count > 1
    }
    
    func newCategoryRange() -> ClosedRange<String.Index> {
        let firstSpaceIndex = glob.firstIndex(of: " ")
        guard let firstSpaceIndex else { return firstComponentRange() }
        
        let firstSpaceDistance = glob.distance(from: glob.startIndex, to: firstSpaceIndex)
        if firstSpaceDistance > 1 {
            return firstComponentRange(before: firstSpaceIndex)
        }
        return firstComponentRange()
    }
    
    func returnNilIfCategoryEmpty(_ category: String) -> String? {
        if category == "" || category == " " {
            return nil
        }
        return category
    }
    
    func removeStringAfterSpaces(_ category: inout String?) {
        guard let _category = category else { return }
        guard let spaceIndex = _category.firstIndex(of: " ") else { return }
        guard _category.distance(from: _category.startIndex, to: spaceIndex) > 0 else {
            category = nil
            return
        }

        let rangeBeforeSpace = _category.startIndex..._category.index(before: spaceIndex)
        category = String(_category[rangeBeforeSpace])
    }
    
    func fixCategories(_ categories: inout [String]) {
        categories = categories.compactMap { category in
            var category = returnNilIfCategoryEmpty(category)
            removeStringAfterSpaces(&category)
            return category
        }
    }
    
    func readCategory() -> [String] {
        var categories = glob.components(separatedBy: " @")
        removeWrongComponentsSplit(categories: &categories)
        guard globContainAtAndMoreThanOneChar() else { return categories }
        
        let newCategory = String(
            glob[newCategoryRange()]
        )
        
        categories.insert(newCategory, at: 0)
        fixCategories(&categories)
        return categories
    }
    
}

extension SearchData {
    enum SearchValue: Equatable {
        case none
        case category(SearchSuggestionListData)
        case title(String)
    }
}
