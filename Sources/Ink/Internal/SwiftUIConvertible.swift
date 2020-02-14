//
//  Ink
//  SwiftUIConvertible.swift
//  Created by Will Taylor on 2/12/20.
//  MIT license, see LICENSE file for details


import SwiftUI

internal protocol SwiftUIConvertible {
    func swiftUIView(usingURLs urls: NamedURLCollection) -> AnyView
}
