/**
 *  Ink
 *  Copyright (c) John Sundell 2019
 *  MIT license, see LICENSE file for details
 */
import Foundation
import SwiftUI

internal struct Link: Fragment {
    
    var modifierTarget: Modifier.Target { .links }
    
    var target: Target
    var text: FormattedText
    
    static func read(using reader: inout Reader) throws -> Link {
        try reader.read("[")
        let text = FormattedText.read(using: &reader, terminator: "]")
        try reader.read("]")
        
        guard !reader.didReachEnd else { throw Reader.Error() }
        
        if reader.currentCharacter == "(" {
            reader.advanceIndex()
            let url = try reader.read(until: ")")
            return Link(target: .url(url), text: text)
        } else {
            try reader.read("[")
            let reference = try reader.read(until: "]")
            return Link(target: .reference(reference), text: text)
        }
    }
    
    func html(usingURLs urls: NamedURLCollection,
              modifiers: ModifierCollection) -> String {
        let url = target.url(from: urls)
        let title = text.html(usingURLs: urls, modifiers: modifiers)
        return "<a href=\"\(url)\">\(title)</a>"
    }
    
    func swiftUIView(usingURLs urls: NamedURLCollection) -> AnyView {
//        let url = URL(string: String(target.url(from: urls)))
        
        guard let a = URL(string: String(target.url(from: urls))) else {
            return AnyView(Text(text.plainText()))
        }
        return AnyView(
            Button(action: {UIApplication.shared.open(a)}) {
                Text(text.plainText()).foregroundColor(Color(.systemBlue))
            }
        )
    }
    
    func plainText() -> String {
        text.plainText()
    }
}

extension Link {
    enum Target {
        case url(InkURL)
        case reference(Substring)
    }
}

extension Link.Target {
    func url(from urls: NamedURLCollection) -> InkURL {
        switch self {
        case .url(let url):
            return url
        case .reference(let name):
            return urls.url(named: name) ?? name
        }
    }
}
