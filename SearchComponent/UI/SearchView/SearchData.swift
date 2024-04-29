//
//  SearchData.swift
//  SearchComponent
//
//  Created by saminos on 30/04/24.
//

struct SearchData: Equatable, ExpressibleByStringInterpolation {
    
    var glob: String = "glob" {
        didSet {
            text = "text: \(glob)"
        }
        
        
    }
    var text: String = ""
    
    init(glob: String) {
        self.glob = glob
    }
    
    static func ==(a: SearchData, b: SearchData) -> Bool {
        a.glob == b.glob
    }
    
    init(stringLiteral value: String) {
        self.init(glob: value)
    }
}
