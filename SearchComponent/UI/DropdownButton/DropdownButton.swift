//
//  DropdownButton.swift
//  SearchComponent
//
//  Created by saminos on 02/05/24.
//

import SwiftUI

struct DropdownButton<Label: View>: View {
    var action: () -> Void
    @ViewBuilder var label: Label
    @State private var arrow: DropdownButtonStyleArrowDirection = .down
    
    var body: some View {
        Button(action: {
            arrow = arrow == .up ? .down : .up
            action()
        }, label: {})
        .buttonStyle(
            DropdownButtonStyle(arrow: $arrow, {
                label
            })
        )
    }
}

struct DropdownButton_Previews: PreviewProvider {
    static var previews: some View {
        DropdownButton(action: {}) {
            Text("Arrow Button")
        }
    }
}
