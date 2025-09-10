//
//  SwiftUIDemoTests.swift
//  SwiftUIDemoTests
//
//  Created by Ritesh Dhodakia on 9/10/25.
//

import Testing
import XCTest
@testable import SwiftUIDemo

struct SwiftUIDemoTests {

    @Test func example() async throws {
        // Write your test here and use APIs like `#expect(...)` to check expected conditions.
        let result = 2 + 2
        XCTAssertEqual(result, 4, "Math is broken!")
    }

    func testExample() throws {
        // Example test
        let result = 2 + 2
        XCTAssertEqual(result, 4, "Math is broken!")
    }
}
