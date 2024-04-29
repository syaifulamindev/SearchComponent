//
//  TappableTextFieldStyle.swift
//  SearchComponent
//
//  Created by saminos on 29/04/24.
//

import SwiftUI

struct TappableTextFieldStyle: TextFieldStyle {
    var backgroundColor: Color
    var foregroundColor: Color
    var cornerRadius: CGFloat
    
    init(backgroundColor: Color = .white, foregroundColor: Color = .black, cornerRadius: CGFloat = 4) {
        self.backgroundColor = backgroundColor
        self.foregroundColor = foregroundColor
        self.cornerRadius = cornerRadius
    }
    
    @FocusState private var textFieldFocused: Bool
    func _body(configuration: TextField<Self._Label>) -> some View {
        configuration
            .textFieldStyle(.plain)
            .padding()
            .background(
                RoundedRectangle(cornerRadius: cornerRadius)
                    .fill(backgroundColor)
            )
            .textFieldCursor(foregroundColor)
            .foregroundColor(foregroundColor)
            .focused($textFieldFocused)
            .onTapGesture {
                textFieldFocused = true
            }
    }
}
