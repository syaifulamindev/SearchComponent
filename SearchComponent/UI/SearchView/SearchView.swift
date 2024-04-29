//
//  SearchView.swift
//  SearchComponent
//
//  Created by saminos on 29/04/24.
//

import SwiftUI

struct SearchView: View {
    @Binding var textFieldInput: String
    @State var textFieldTitle: String = ""
    var backgroundColor: Color = .white
    var body: some View {
        VStack (spacing: 0) {
            TextField(textFieldTitle, text: $textFieldInput)
                .textFieldStyle(TappableTextFieldStyle(backgroundColor: backgroundColor))
        }
    }
}

struct SearchView_Previews: PreviewProvider {
    
    static var previews: some View {
        SearchView(textFieldInput: .constant("tes"))
    }
}


