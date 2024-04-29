//
//  ContentView.swift
//  SearchComponent
//
//  Created by saminos on 29/04/24.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            SearchView(textFieldInput: .constant("tes"))
                .padding(8)
        }
        .background(.gray)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
