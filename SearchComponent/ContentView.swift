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
            SearchView(textFieldInput: .constant(""))
                .padding(8)
            Spacer(minLength: 300)
        }
        .frame(width: 400)
        .background(.gray)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
