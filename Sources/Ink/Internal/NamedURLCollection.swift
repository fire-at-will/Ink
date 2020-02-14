/**
*  Ink
*  Copyright (c) John Sundell 2019
*  MIT license, see LICENSE file for details
*/

internal struct NamedURLCollection {
    private let urlsByName: [String : InkURL]

    init(urlsByName: [String : InkURL]) {
        self.urlsByName = urlsByName
    }

    func url(named name: Substring) -> InkURL? {
        urlsByName[name.lowercased()]
    }
}
