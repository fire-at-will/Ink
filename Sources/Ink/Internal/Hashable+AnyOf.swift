/**
*  Ink
*  Copyright (c) John Sundell 2019
*  MIT license, see LICENSE file for details
*/

@available(iOS 13.0.0, *)
@available(OSX 10.15, *)
internal extension Hashable {
    func isAny(of candidates: Set<Self>) -> Bool {
        return candidates.contains(self)
    }
}
