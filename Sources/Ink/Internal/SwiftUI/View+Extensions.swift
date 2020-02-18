//
//  View+Extensions.swift
//  Ink
//
//  Created by Will Taylor on 2/17/20.
//  Copyright © 2020 Will Taylor. All rights reserved.
//

import Foundation
import SwiftUI

extension View {
    func leadingAligned() -> some View {
        HStack {
            self
            Spacer()
        }
        .frame(maxWidth: .infinity)
    }
}
