/**
*  Ink
*  Copyright (c) John Sundell 2019
*  MIT license, see LICENSE file for details
*/

import XCTest
import Ink

@available(iOS 13.0.0, *)
@available(OSX 10.15, *)
final class ImageTests: XCTestCase {
    func testImageWithURL() {
        let html = MarkdownParser().html(from: "![](url)")
        XCTAssertEqual(html, #"<img src="url"/>"#)
    }

    func testImageWithReference() {
        let html = MarkdownParser().html(from: """
        ![][url]
        [url]: https://swiftbysundell.com
        """)

        XCTAssertEqual(html, #"<img src="https://swiftbysundell.com"/>"#)
    }

    func testImageWithURLAndAltText() {
        let html = MarkdownParser().html(from: "![Alt text](url)")
        XCTAssertEqual(html, #"<img src="url" alt="Alt text"/>"#)
    }

    func testImageWithReferenceAndAltText() {
        let html = MarkdownParser().html(from: """
        ![Alt text][url]
        [url]: swiftbysundell.com
        """)

        XCTAssertEqual(html, #"<img src="swiftbysundell.com" alt="Alt text"/>"#)
    }

    func testImageWithinParagraph() {
        let html = MarkdownParser().html(from: "Text ![](url) text")
        XCTAssertEqual(html, #"<p>Text <img src="url"/> text</p>"#)
    }
}

@available(iOS 13.0.0, *)
@available(OSX 10.15, *)
extension ImageTests {
    static var allTests: Linux.TestList<ImageTests> {
        return [
            ("testImageWithURL", testImageWithURL),
            ("testImageWithReference", testImageWithReference),
            ("testImageWithURLAndAltText", testImageWithURLAndAltText),
            ("testImageWithReferenceAndAltText", testImageWithReferenceAndAltText),
            ("testImageWithinParagraph", testImageWithinParagraph)
        ]
    }
}
