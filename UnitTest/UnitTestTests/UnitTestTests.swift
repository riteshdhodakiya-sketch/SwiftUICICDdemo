//
//  UnitTestTests.swift
//  UnitTestTests
//
//  Created by Ritesh Dhodakia on 9/11/25.
//

import Testing
import XCTest

struct UnitTestTests {

    @Test func testAlwaysFails() {
        XCTAssertEqual(1, 2, "1 is not equal to 2 — this test fails.")
    }
}
