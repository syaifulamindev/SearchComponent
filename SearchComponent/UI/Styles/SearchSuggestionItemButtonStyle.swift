//
//  SearchSuggestionItemButtonStyle.swift
//  SearchComponent
//
//  Created by saminos on 01/05/24.
//

import SwiftUI

struct SearchSuggestionItemButtonStyle: ButtonStyle {
    var isFocused: Bool
    func makeBody(configuration: Configuration) -> some View {
        HStack {
        
        configuration.label
                .padding(EdgeInsets(top: 8, leading: 8, bottom: 8, trailing: 8))
                
                .font(.system(size: 14))
                .foregroundColor(isFocused ? .gray : .black)
            Spacer()
        }
        .background(isFocused ? .yellow : .white)
    }
}

struct SearchSuggestionItemButtonStyle_Previews: PreviewProvider {
    static var previews: some View {
        VStack {
            Button(action: {}, label: {Text("SearchSuggestionItemButtonStyle Normal")})
                .buttonStyle(SearchSuggestionItemButtonStyle(isFocused: false))
            Button(action: {}, label: {Text("SearchSuggestionItemButtonStyle Focused")})
                .buttonStyle(SearchSuggestionItemButtonStyle(isFocused: true))
        }
    }
}
