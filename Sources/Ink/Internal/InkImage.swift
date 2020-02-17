/**
*  Ink
*  Copyright (c) John Sundell 2019
*  MIT license, see LICENSE file for details
*/

import SwiftUI

internal struct InkImage: Fragment {
    var modifierTarget: Modifier.Target { .images }

    private var link: Link

    static func read(using reader: inout Reader) throws -> InkImage {
        try reader.read("!")
        return try InkImage(link: .read(using: &reader))
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
    
    func swiftUIView(usingURLs urls: NamedURLCollection) -> AnyView {
        let urlString = String(link.target.url(from: urls))
        let url = URL(string: urlString)
        return AnyView(HStack {
            URLImage(imageUrl: url)
                .padding(.vertical)
            Spacer()
        })
    }

    func plainText() -> String {
        link.plainText()
    }
}
