//
//  ThemeImplementations.swift
//  Themeable
//
//  Created by Cas Hoefman on 5/15/25.
//

import SwiftUI

// MARK: - Color Extension (Hex Initializer)
/// Extends SwiftUI's Color struct to support creation from hexadecimal color strings.
extension Color {
    
    /// Initializes a SwiftUI Color from a hexadecimal string representation.
    ///
    /// Supports:
    /// - 3-digit hex (RGB)
    /// - 6-digit hex (RRGGBB)
    /// - 8-digit hex (AARRGGBB)
    ///
    /// - Parameter hex: The hex color string (e.g., \"#FFFFFF\", \"FFF\", \"FFFFFFFF\").
    init(hex: String) {
        // Remove any non-alphanumeric characters (like "#")
        let hex = hex.trimmingCharacters(in: CharacterSet.alphanumerics.inverted)
        var int: UInt64 = 0
        Scanner(string: hex).scanHexInt64(&int)
        
        let a, r, g, b: UInt64
        
        switch hex.count {
        case 3: // RGB (12-bit, e.g., "FFF")
            (a, r, g, b) = (255, (int >> 8) * 17, (int >> 4 & 0xF) * 17, (int & 0xF) * 17)
        case 6: // RGB (24-bit, e.g., "FFFFFF")
            (a, r, g, b) = (255, int >> 16, int >> 8 & 0xFF, int & 0xFF)
        case 8: // ARGB (32-bit, e.g., "FFFFFFFF")
            (a, r, g, b) = (int >> 24, int >> 16 & 0xFF, int >> 8 & 0xFF, int & 0xFF)
        default:
            // Fallback to transparent color for invalid hex strings
            (a, r, g, b) = (0, 0, 0, 0)
        }
        
        // Initialize SwiftUI Color using calculated RGB and Alpha values
        self.init(
            .sRGB,
            red: Double(r) / 255,
            green: Double(g) / 255,
            blue: Double(b) / 255,
            opacity: Double(a) / 255
        )
    }
}
