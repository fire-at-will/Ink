/**
*  Ink
*  Copyright (c) John Sundell 2019
*  MIT license, see LICENSE file for details
*/

@available(iOS 13.0.0, *)
@available(OSX 10.15, *)
internal enum TextStyle {
    case italic
    case bold
    case strikethrough
}

@available(iOS 13.0.0, *)
@available(OSX 10.15, *)
extension TextStyle {
    var htmlTagName: String {
        switch self {
        case .italic: return "em"
        case .bold: return "strong"
        case .strikethrough: return "s"
        }
    }
}
