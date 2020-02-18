/**
*  Ink
*  Copyright (c) John Sundell 2019
*  MIT license, see LICENSE file for details
*/
import SwiftUI

internal struct Paragraph: Fragment {
    
    var modifierTarget: Modifier.Target { .paragraphs }

    private var text: FormattedText

    static func read(using reader: inout Reader) -> Paragraph {
        return Paragraph(text: .read(using: &reader))
    }

    func html(usingURLs urls: NamedURLCollection,
              modifiers: ModifierCollection) -> String {
        let body = text.html(usingURLs: urls, modifiers: modifiers)
        return "<p>\(body)</p>"
    }
    
    func swiftUIView(usingURLs urls: NamedURLCollection) -> AnyView {
        let body = text.plainText()
        return AnyView(Text(body).font(.body).fixedSize(horizontal: false, vertical: true).leadingAligned())
    }

    func plainText() -> String {
        text.plainText()
    }
}
