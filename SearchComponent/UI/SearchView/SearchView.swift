//
//  SearchView.swift
//  SearchComponent
//
//  Created by saminos on 29/04/24.
//

import SwiftUI

struct SearchView: View {
    @Binding var textFieldInput: String
    @State var textFieldTitle: String = "Search something.."
    @State var search: SearchData = "search data"
    
    var body: some View {
        VStack (spacing: 0) {
            TextField(textFieldTitle, text: $search.glob)
                .textFieldStyle(TappableTextFieldStyle())
                .onChange(of: search.text) { newValue in
                    print(newValue)
                }
        }
    }
}

struct SearchView_Previews: PreviewProvider {
    
    static var previews: some View {
        SearchView(textFieldInput: .constant("tes"))
    }
}


