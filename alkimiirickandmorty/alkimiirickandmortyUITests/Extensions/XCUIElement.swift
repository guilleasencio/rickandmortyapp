//
//  XCUIElement.swift
//  alkimiirickandmortyUITests
//
//  Created by Guillermo Asencio Sanchez on 15/9/24.
//

import Foundation

import XCTest

extension XCUIElement {
    public class var defaultMaxSwipesCount: Int { return 10 }
    
    func visible(insets: UIEdgeInsets = .zero) -> Bool {
        guard exists, !frame.isEmpty else { return false }
        var windowFrame = XCUIApplication().windows.element(boundBy: 0).frame
        windowFrame.size.height = windowFrame.size.height - insets.top - insets.bottom
        windowFrame.origin.y += insets.top
        return windowFrame.contains(frame)
    }
    
    func waitUntilVisible(_ seconds: Int = 30) -> Bool {
        if visible() {
            return true
        }
        return waitForExistence(timeout: TimeInterval(seconds))
    }
}
