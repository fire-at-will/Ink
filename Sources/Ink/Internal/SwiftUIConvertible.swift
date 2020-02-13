//
//  Ink
//  SwiftUIConvertible.swift
//  Created by Will Taylor on 2/12/20.
//  MIT license, see LICENSE file for details


import SwiftUI

@available(iOS 13.0.0, *)
@available(OSX 10.15, *)
internal protocol SwiftUIConvertible {
    func swiftUIView() -> AnyView
}
