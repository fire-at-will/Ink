/**
*  Ink
*  Copyright (c) John Sundell 2019
*  MIT license, see LICENSE file for details
*/

@available(iOS 13.0.0, *)
@available(OSX 10.15, *)
internal extension Substring {
    func trimmingLeadingWhitespaces() -> Self {
        drop(while: { $0.isWhitespace })
    }

    func trimmingTrailingWhitespaces() -> Self {
        var trimmed = self

        while trimmed.last?.isWhitespace == true {
            trimmed = trimmed.dropLast()
        }

        return trimmed
    }
}
