/**
*  Ink
*  Copyright (c) John Sundell 2019
*  MIT license, see LICENSE file for details
*/
import SwiftUI

struct InlineCode: Fragment {
    var modifierTarget: Modifier.Target { .inlineCode }

    private var code: String

    static func read(using reader: inout Reader) throws -> InlineCode {
        try reader.read("`")
        var code = ""

        while !reader.didReachEnd {
            switch reader.currentCharacter {
            case \.isNewline:
                throw Reader.Error()
            case "`":
                reader.advanceIndex()
                return InlineCode(code: code)
            default:
                if let escaped = reader.currentCharacter.escaped {
                    code.append(escaped)
                } else {
                    code.append(reader.currentCharacter)
                }

                reader.advanceIndex()
            }
        }

        throw Reader.Error()
    }

    func html(usingURLs urls: NamedURLCollection,
              modifiers: ModifierCollection) -> String {
        return "<code>\(code)</code>"
    }
    
    func swiftUIView(usingURLs urls: NamedURLCollection) -> AnyView {
        return AnyView(Text(code).background(Color.green.opacity(0.8).cornerRadius(2)))
    }

    func plainText() -> String {
        code
    }
}
