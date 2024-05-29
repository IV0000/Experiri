//
//  Color+Hex.swift
//  Experiri
//
//  Created by Ivan Voloshchuk on 29/05/24.
//

import SwiftUI

extension Color {
    init(hex: UInt, alpha: Double = 1) {
        self.init(.sRGB,
                  red: Double((hex >> 16) & 0xFF) / 255,
                  green: Double((hex >> 08) & 0xFF) / 255,
                  blue: Double((hex >> 00) & 0xFF) / 255,
                  opacity: alpha)
    }
}
