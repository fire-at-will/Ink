//
//  Ink
//  SwiftUIConvertible.swift
//  Created by Will Taylor on 2/12/20.
//  MIT license, see LICENSE file for details


import SwiftUI
internal protocol SwiftUIConvertible {
    @available(OSX 10.15, *)
    func swiftUIView() -> AnyView
}
