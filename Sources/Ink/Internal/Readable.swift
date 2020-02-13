/**
*  Ink
*  Copyright (c) John Sundell 2019
*  MIT license, see LICENSE file for details
*/

internal protocol Readable {
    static func read(using reader: inout Reader) throws -> Self
}

@available(iOS 13.0.0, *)
@available(OSX 10.15, *)
extension Readable {
    static func readOrRewind(using reader: inout Reader) throws -> Self {
        guard reader.previousCharacter != "\\" else {
            throw Reader.Error()
        }

        let previousReader = reader

        do {
            return try read(using: &reader)
        } catch {
            reader = previousReader
            throw error
        }
    }
}
