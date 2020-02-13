/**
*  Ink
*  Copyright (c) John Sundell 2019
*  MIT license, see LICENSE file for details
*/

@available(iOS 13.0.0, *)
@available(OSX 10.15, *)
internal extension Character {
    var isSameLineWhitespace: Bool {
        isWhitespace && !isNewline
    }
}

@available(iOS 13.0.0, *)
@available(OSX 10.15, *)
internal extension Set where Element == Character {
    static let boldItalicStyleMarkers: Self = ["*", "_"]
    static let allStyleMarkers: Self = boldItalicStyleMarkers.union(["~"])
}
