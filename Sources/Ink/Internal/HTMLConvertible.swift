/**
*  Ink
*  Copyright (c) John Sundell 2019
*  MIT license, see LICENSE file for details
*/

internal protocol HTMLConvertible {
    func html(usingURLs urls: NamedURLCollection,
              modifiers: ModifierCollection) -> String
}

@available(iOS 13.0.0, *)
@available(OSX 10.15, *)
extension HTMLConvertible where Self: Modifiable {
    func html(usingURLs urls: NamedURLCollection,
              rawString: Substring,
              applyingModifiers modifiers: ModifierCollection) -> String {
        var html = self.html(usingURLs: urls, modifiers: modifiers)

        modifiers.applyModifiers(for: modifierTarget) { modifier in
            html = modifier.closure((html, rawString))
        }

        return html
    }
}
