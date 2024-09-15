//
//  UICharacterDetailsTests.swift
//  alkimiirickandmortyUITests
//
//  Created by Guillermo Asencio Sanchez on 15/9/24.
//

import XCTest

final class UICharacterDetailsTests: UIBaseTest {

    func testCharacterDetailsIsPresentedCorrectly() throws {
        app.launch()

        // Character List
        assertElementExists(app.collectionViews["characters_list"])
        assertElementExists(app.buttons["characters_list_row_1"])
        
        let firstRow = app.buttons["characters_list_row_1"]
        assertElementExists(firstRow)
        
        firstRow.tap()
        
        // Character Details
        assertElementExists(app.staticTexts["character_details_name"])
        assertElementExists(app.buttons["character_details_favorite_button"])
    }
}
