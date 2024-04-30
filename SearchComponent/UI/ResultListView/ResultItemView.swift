//
//  ResultItemView.swift
//  SearchComponent
//
//  Created by saminos on 30/04/24.
//

import SwiftUI

struct ResultItemView: View {
    var item: ResultItemData
    var onItemSelected: ((_ option: ResultItemData) -> Void)?

    var body: some View {
        Button(action: {
            if let onItemSelected {
                onItemSelected(self.item)
            }
        }) {
            HStack {
                Text(self.item.value)
                    .font(.system(size: 14))
                    .foregroundColor(Color.black)
                Spacer()
            }
        }
        .padding(.horizontal, 16)
        .padding(.vertical, 5)
    }
}

struct ResultRowView_Previews: PreviewProvider {
    static var previews: some View {
        ResultItemView(
            item: ResultItemData(value: "test"),
            onItemSelected: nil
        )
    }
}
