/**
*  Ink
*  Copyright (c) John Sundell 2019
*  MIT license, see LICENSE file for details
*/

import SwiftUI

@available(iOS 13.0.0, *)
@available(OSX 10.15, *)
internal struct Image: Fragment {
    var modifierTarget: Modifier.Target { .images }

    private var link: Link

    static func read(using reader: inout Reader) throws -> Image {
        try reader.read("!")
        return try Image(link: .read(using: &reader))
    }

    func html(usingURLs urls: NamedURLCollection,
              modifiers: ModifierCollection) -> String {
        let url = link.target.url(from: urls)
        var alt = link.text.html(usingURLs: urls, modifiers: modifiers)

        if !alt.isEmpty {
            alt = " alt=\"\(alt)\""
        }

        return "<img src=\"\(url)\"\(alt)/>"
    }
    
    func swiftUIView() -> AnyView {
        return AnyView(Text("TODO: Image"))
    }

    func plainText() -> String {
        link.plainText()
    }
}
