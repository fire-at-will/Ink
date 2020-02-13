/**
*  Ink
*  Copyright (c) John Sundell 2019
*  MIT license, see LICENSE file for details
*/

import SwiftUI

internal struct Blockquote: Fragment {
    var modifierTarget: Modifier.Target { .blockquotes }

    private var text: FormattedText

    static func read(using reader: inout Reader) throws -> Blockquote {
        try reader.read(">")
        try reader.readWhitespaces()

        var text = FormattedText.readLine(using: &reader)

        while !reader.didReachEnd {
            switch reader.currentCharacter {
            case \.isNewline:
                return Blockquote(text: text)
            case ">":
                reader.advanceIndex()
            default:
                break
            }

            text.append(FormattedText.readLine(using: &reader))
        }

        return Blockquote(text: text)
    }

    func html(usingURLs urls: NamedURLCollection,
              modifiers: ModifierCollection) -> String {
        let body = text.html(usingURLs: urls, modifiers: modifiers)
        return "<blockquote><p>\(body)</p></blockquote>"
    }
    
    @available(OSX 10.15, *)
    func swiftUIView() -> AnyView {
        let body = text.plainText()
        return AnyView(Text(body).modifier(BlockQuote()))
    }

    func plainText() -> String {
        text.plainText()
    }
}

@available(OSX 10.15, *)
fileprivate struct BlockQuote: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(.body)
            .background(Color.gray.opacity(0.7))
            .cornerRadius(10)
            .padding()
    }
}
