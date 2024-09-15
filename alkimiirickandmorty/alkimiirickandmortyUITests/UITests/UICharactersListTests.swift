//
//  UICharactersListTests.swift
//  alkimiirickandmortyUITests
//
//  Created by Guillermo Asencio Sanchez on 15/9/24.
//

import XCTest

final class UICharactersListTests: UIBaseTest {

    func testCharacterListPresentsCorrectly() throws {
        app.launch()

        assertElementExists(app.staticTexts["gender_label"])
        assertElementExists(app.buttons["gender_picker"])
        assertElementExists(app.collectionViews["characters_list"])
    }
}
