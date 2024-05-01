//
//  SearchSuggestionItemView.swift
//  SearchComponent
//
//  Created by saminos on 30/04/24.
//

import SwiftUI

struct SearchSuggestionItemView: View {
    var item: SearchSuggestionData
    var onItemSelected: ((_ option: SearchSuggestionData) -> Void)?
    var isFocused: Bool = false
    
//    var buttonStyle: any PrimitiveButtonStyle {
//
//    }
    var body: some View {
        Button(action: {
            print("button presbb")
            if let onItemSelected {
                onItemSelected(self.item)
            }
        }) {
            Text(self.item.value)
                
                
        }
        .buttonStyle(SearchSuggestionItemButtonStyle(isFocused: isFocused))
        
        
//        .padding(.horizontal, 16)
//        .padding(.vertical, 5)
    }
}

struct ResultRowView_Previews: PreviewProvider {
    static var previews: some View {
        SearchSuggestionItemView(
            item: SearchSuggestionData(index: 0, value: "test"),
            onItemSelected: nil
        )
    }
}
