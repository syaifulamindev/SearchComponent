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
        withTextView { tv in
            tv.insertionPointColor = NSColor(color)
        }
    }
    
    func textFieldSelect(_ loc: Int, len: Int) -> some View {
        withTextView { tv in
            let tv = tv
            DispatchQueue.main.async {
                tv.window?.makeFirstResponder(tv)
                tv.setSelectedRange(NSMakeRange(loc, len))
            }
        }
    }
    
    private func withTextView( updateTextView: @escaping (inout NSTextView) -> Void ) -> some View {
        self
            #if os(macOS)
            .introspect(.textField, on: .macOS(.v10_15, .v11, .v12, .v13, .v14)) { textField in
                guard var fieldEditor = textField.window?.fieldEditor(true, for: textField) as? NSTextView else { return }
                updateTextView(&fieldEditor)
            }
            #endif
    }
    
}
