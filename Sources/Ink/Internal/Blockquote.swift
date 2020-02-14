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
    
    func swiftUIView(usingURLs urls: NamedURLCollection) -> AnyView {
        let body = text.swiftUIView(usingURLs: urls)
        return AnyView(body.modifier(BlockQuote()).fixedSize(horizontal: false, vertical: true))
    }
    
    func plainText() -> String {
        text.plainText()
    }
}

fileprivate struct BlockQuote: ViewModifier {
    func body(content: Content) -> some View {
        HStack(spacing: 8) {
            RoundedRectangle(cornerRadius: 2)
                .fill(Color(.tertiaryLabel))
                .frame(maxWidth: 4, maxHeight: .infinity)
            content
                .font(.body)
                .foregroundColor(Color(.secondaryLabel))
            Spacer()
        }
        .padding()
        
    }
}
