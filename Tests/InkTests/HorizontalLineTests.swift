/**
*  Ink
*  Copyright (c) John Sundell 2019
*  MIT license, see LICENSE file for details
*/

import XCTest
import Ink

@available(OSX 10.15, *)
final class HorizontalLineTests: XCTestCase {
    func testHorizonalLineWithDashes() {
        let html = MarkdownParser().html(from: """
        Hello

        ---

        World
        """)

        XCTAssertEqual(html, "<p>Hello</p><hr><p>World</p>")
    }

    func testHorizontalLineWithDashesAtTheStartOfString() {
        let html = MarkdownParser().html(from: "---\nHello")
        XCTAssertEqual(html, "<hr><p>Hello</p>")
    }

    func testHorizontalLineWithAsterisks() {
        let html = MarkdownParser().html(from: """
        Hello

        ***

        World
        """)

        XCTAssertEqual(html, "<p>Hello</p><hr><p>World</p>")
    }
}

@available(OSX 10.15, *)
extension HorizontalLineTests {
    static var allTests: Linux.TestList<HorizontalLineTests> {
        return [
            ("testHorizonalLineWithDashes", testHorizonalLineWithDashes),
            ("testHorizontalLineWithDashesAtTheStartOfString", testHorizontalLineWithDashesAtTheStartOfString),
            ("testHorizontalLineWithAsterisks", testHorizontalLineWithAsterisks)
        ]
    }
}
