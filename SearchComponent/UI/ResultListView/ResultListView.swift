//
//  ResultListView.swift
//  SearchComponent
//
//  Created by saminos on 30/04/24.
//

import SwiftUI

struct ResultListView: View {
    var items: [ResultItemData]
    var onItemSelected: ((_ item: ResultItemData) -> Void)?
    
    var body: some View {
        ScrollView {
            LazyVStack(alignment: .leading, spacing: 0) {
                ForEach(self.items, id: \.self) { option in
                    ResultItemView(item: option, onItemSelected: self.onItemSelected)
                }
            }
        }
        .frame(minHeight: 100)
        .padding(.vertical, 5)
        .background(Color.white)
        .cornerRadius(5)
        .overlay(
            RoundedRectangle(cornerRadius: 5)
                .stroke(Color.gray, lineWidth: 1)
        )
    }
}

struct ResultListView_Previews: PreviewProvider {
    static var previews: some View {
        ResultListView(items: [
            ResultItemData(value: "One"),
            ResultItemData(value: "Two"),
            ResultItemData(value: "Three")
        ])
    }
}
