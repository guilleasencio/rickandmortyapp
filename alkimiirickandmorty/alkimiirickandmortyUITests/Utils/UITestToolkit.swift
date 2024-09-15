//
//  UITestToolkit.swift
//  alkimiirickandmortyUITests
//
//  Created by Guillermo Asencio Sanchez on 15/9/24.
//

import XCTest

func assertElementExists(_ element: XCUIElement, until waitingTime: Int = 30) {
    let exists = element.waitUntilVisible(waitingTime)
    XCTAssertTrue(exists)
}
