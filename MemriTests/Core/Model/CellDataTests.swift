//
//  CellDataTests.swift
//  MemriTests
//
//  Created by Olorunshola Godwin on 15/08/2021.
//

import XCTest
@testable import Memri

class CellDataTests: XCTestCase {
    
    func test_getSingleValue() {
        let data = CellData.single("single_value")
        XCTAssertEqual(data.getSingleValue(), "single_value")
        XCTAssertEqual(data.getArrayValue(), [])

    }
    
    func test_getArrayValue() {
        let data = CellData.array(["first_value", "second_value"])
        XCTAssertEqual(data.getArrayValue(), ["first_value", "second_value"])
        XCTAssertEqual(data.getSingleValue(), "")
    }
}
