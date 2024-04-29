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
    var body: some View {
        TextField(textFieldTitle, text: $textFieldInput)
            .background(
                RoundedRectangle(cornerRadius: 4)
                    .fill(.white)
            )
            .foregroundColor(.black)
            .frame(height: 38)
    }
}

struct SearchView_Previews: PreviewProvider {
    
    static var previews: some View {
        SearchView(textFieldInput: .constant("tes"))
    }
}


