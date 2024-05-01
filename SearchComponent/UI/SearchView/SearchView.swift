//
//  SearchView.swift
//  SearchComponent
//
//  Created by saminos on 29/04/24.
//

import SwiftUI
import AppKit

//extension SearchView {
//    enum FocusField: Hashable {
//        case search
//    }
//}

struct SearchView: View {
    
    @Binding var textFieldInput: String
    @State var textFieldTitle: String = "Search something.."
    @State var search: SearchData = "Search Something"
    @State private var keyMonitor: Any?
    
//    @FocusState var focus: FocusField?
    @State var focusedItem: SearchSuggestionData?
    @State var data: SearchSuggestionListData = .init([])
    
    
    var body: some View {
        VStack (spacing: 0) {
            TextField(textFieldTitle, text: $search.glob)
//                .focused($focus, equals: .search)
                .textFieldStyle(TappableTextFieldStyle())
                
        }
        .onChange(of: search.value) { value in
            if case .category(let categories) = search.value {
                self.data = categories
            }
        }
        .overlay(
            VStack {
                if case .category(let categories) = search.value {
                    Spacer(minLength:  56)
                    SearchSuggestionListView(
                        data: $data,
                        focusedItem: $focusedItem
                    )
                }
            }
                ,
            alignment: .topLeading
        )
        .onAppear {
            keyMonitor = NSEvent.addLocalMonitorForEvents(matching: .keyDown) { (aEvent) -> NSEvent? in
                    self.keyDown(with: aEvent)
                    
                }
        }
        .onDisappear {
            if let keyMonitor {
                NSEvent.removeMonitor(keyMonitor)
            }
        }
        
    }
    
    func keyDown(with event: NSEvent) -> NSEvent? {
        
        guard let focusedItem else { return event }
        if event.keyCode == Keycode.upArrow {
//            focus = .none
            guard focusedItem.index > 0 else { return nil}
            self.focusedItem = data.list[focusedItem.index - 1]
            return nil
        } else if event.keyCode == Keycode.downArrow {
//            focus = .none
            guard focusedItem.index < data.list.count - 1 else { return nil }
            self.focusedItem = data.list[focusedItem.index + 1]
            return nil
        }
        return event
    }
}
