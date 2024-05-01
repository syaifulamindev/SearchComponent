//
//  NSTableView + Extension.swift
//  SearchComponent
//
//  Created by saminos on 01/05/24.
//

import AppKit

extension NSTableView {
    open override func viewWillMove(toWindow newWindow: NSWindow?) {
        super.viewWillMove(toWindow: newWindow)
        backgroundColor = .clear
        enclosingScrollView?.drawsBackground = false
        selectionHighlightStyle = .none
    }
}

