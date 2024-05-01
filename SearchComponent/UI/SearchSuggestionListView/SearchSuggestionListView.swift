//
//  SearchSuggestionListView.swift
//  SearchComponent
//
//  Created by saminos on 30/04/24.
//

import SwiftUI

struct SearchSuggestionListView: View {
    @Binding var data: SearchSuggestionListData
    
    func onItemSelected(_ item: SearchSuggestionData) {
        focusedItem = item
    }
    
    @Binding var focusedItem: SearchSuggestionData?
    
    func isFocused(_ item: SearchSuggestionData) -> Bool {
        guard let focusedItem else { return false }
        print("\nisFocused: \(focusedItem)\nitem: \(item)isFocused: \(focusedItem == item)\n")
        return focusedItem.index == item.index
    }
    
    var body: some View {
//        ScrollView {
        GeometryReader { gp in
            List(selection: $focusedItem) {
                ForEach(self.data.list, id: \.self) { option in
                    SearchSuggestionItemView(item: option, onItemSelected: self.onItemSelected, isFocused: isFocused(option))
                        .padding(.zero)
                }
                

            }
            .padding(EdgeInsets(top: -gp.safeAreaInsets.top, leading: -16, bottom: 0, trailing: -16))
            .background(Color.white)
            .cornerRadius(5)
            .frame(minHeight: 300)
            
        }
        .onAppear {
            focusedItem = data.list.first
        }
    }
    
}

struct ResultListView_Previews: PreviewProvider {
    
    static var previews: some View {
        
        SearchSuggestionListView(
            data: .constant(SearchSuggestionListData(["One", "Two", "Three"])),
            focusedItem: .constant(nil)
        )
    }
}
