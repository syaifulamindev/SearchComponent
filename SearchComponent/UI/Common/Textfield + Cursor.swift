//
//  Textfield + Cursor.swift
//  SearchComponent
//
//  Created by saminos on 29/04/24.
//

import SwiftUI
import SwiftUIIntrospect
extension View {
    func textFieldCursor(_ color: Color) -> some View {
        self
            #if os(macOS)
            .introspect(.textField, on: .macOS(.v10_15, .v11, .v12, .v13, .v14)) { textField in
                let fieldEditor = textField.window?.fieldEditor(true, for: textField) as? NSTextView
                // Change insertion point color
                fieldEditor?.insertionPointColor = NSColor(color)
            }
            #endif
    }
}
