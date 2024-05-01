//
//  SearchSuggestionListView.swift
//  SearchComponent
//
//  Created by saminos on 30/04/24.
//

import SwiftUI

struct SearchSuggestionListView: View {
    var data: SearchSuggestionListData
    
    init(data: SearchSuggestionListData) {
        self.data = data
//        self.focusedItemSelection = .constant(items.first)
    }
//    var onItemSelected: ((_ item: SearchSuggestionData) -> Void)? = { item in
//        print(item)
//        focusedItem = item
//    }()
    
    func onItemSelected(_ item: SearchSuggestionData) {
        focusedItem = item
    }
    
    @State private var focusedItem: SearchSuggestionData?
    @State private var lastFocusedItem: SearchSuggestionData?
    
    func isFocused(_ item: SearchSuggestionData) -> Bool {
        guard let lastFocusedItem else { return false }
        print("\nisFocused: \(lastFocusedItem)\nitem: \(item)isFocused: \(lastFocusedItem == item)\n")
        return lastFocusedItem.index == item.index
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
            .onChange(of: focusedItem) { newValue in
                guard let newValue else { return }
                lastFocusedItem = focusedItem
            }
            .onAppear {
                focusedItem = data.list.first
            }
            .padding(EdgeInsets(top: -gp.safeAreaInsets.top, leading: -16, bottom: 0, trailing: -16))
            .background(Color.white)
            .cornerRadius(5)
            .frame(minHeight: 300)
        }
    }
}

struct ResultListView_Previews: PreviewProvider {
    
    static var previews: some View {
        
        SearchSuggestionListView(
            data:SearchSuggestionListData(["One", "Two", "Three"])
        )
    }
}
