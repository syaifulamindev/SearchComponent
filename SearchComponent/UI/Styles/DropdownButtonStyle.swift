//
//  DropdownButtonStyle.swift
//  SearchComponent
//
//  Created by saminos on 02/05/24.
//

import SwiftUI

enum DropdownButtonStyleArrowDirection {
    case up, down
}
struct DropdownButtonStyle<Content: View>: ButtonStyle {
    
    @Binding var arrow: DropdownButtonStyleArrowDirection
    let backgroundColor: Color
    let foregroundColor: Color
    let cornerRadius: CGFloat
    
    let label: Content
    init(arrow: Binding<DropdownButtonStyleArrowDirection> , backgroundColor: Color = .white, foregroundColor: Color = .black, cornerRadius: CGFloat = 4, @ViewBuilder _ label: () -> Content) {
        self._arrow = arrow
        self.backgroundColor = backgroundColor
        self.foregroundColor = foregroundColor
        self.cornerRadius = cornerRadius
        self.label = label()
        
    }
    
    func makeBody(configuration: Configuration) -> some View {
        HStack {
            label
                .padding(EdgeInsets(top: 8, leading: 8, bottom: 8, trailing: 8))
            
                .font(.system(size: 14))
                .foregroundColor(foregroundColor)
            Spacer()
            Image("arrowUp")
                .padding(EdgeInsets(top: 0, leading: 8, bottom: 0, trailing: 8))
                .rotationEffect(.degrees(arrow == .up ? 0 : 180))
                .animation(.linear, value: arrow)
            
        }
        .opacity(configuration.isPressed ? 0.5 : 1)
        .background(
            RoundedRectangle(cornerRadius: cornerRadius)
                .fill(backgroundColor)
        )
    }
}

struct DropdownButtonStyle_Previews: PreviewProvider {
    static var previews: some View {
        VStack {
            Button(action: {}, label: { Text("Button") })
                .buttonStyle(DropdownButtonStyle(arrow: .constant(.down)) {
                    Text("Button")
                })
        }
    }
}
