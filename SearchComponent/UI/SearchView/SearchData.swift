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
                type = .category(categories)
            } else if glob.count != 0 {
                type = .title(glob)
            } else {
                type = .none
            }
        }
    }
    
    private let categoryPrefix = "@"
    
    
    var type: SearchType = .none
    
    
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
    
    func removeEmptyCategories(_ categories: inout [String]) {
        categories = categories.compactMap { category in
            if category == "" || category == " " {
                return nil
            }
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
        removeEmptyCategories(&categories)
        return categories
    }
    
}

extension SearchData {
    enum SearchType {
        case none
        case category([String])
        case title(String)
    }
}
