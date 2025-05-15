//
//  ThemeID.swift
//  Themeable
//
//  Created by Cas Hoefman on 5/15/25.
//

import SwiftUI

// MARK: - ThemeID
/// A unique identifier representing a specific theme.
/// It acts as a key for retrieving theme details and color configurations.
struct ThemeID: Identifiable, Equatable, Hashable, RawRepresentable {
    
    /// The underlying string identifier for the theme.
    let rawValue: String
    
    /// Conformance to Identifiable; returns the raw string identifier.
    var id: String { rawValue }

    /// Initializes a ThemeID using a raw string value.
    /// - Parameter rawValue: The unique string representing the theme ID.
    init(rawValue: String) {
        self.rawValue = rawValue
    }
    
    /// Convenience initializer directly from a string.
    /// - Parameter id: The unique string identifier for a theme.
    init(_ id: String) {
        self.rawValue = id
    }
    
    /// Retrieves the concrete theme implementation (colors, etc.) for the given color scheme (light/dark).
    /// - Parameter colorScheme: The desired color scheme.
    /// - Returns: A theme conforming to ThemeProtocol.
    func theme(for colorScheme: ColorScheme) -> ThemeProtocol {
        // Attempt to get theme data using the ThemeManager.
        if let themeData = ThemeManager.shared.getThemeData(by: self.rawValue) {
            return CustomJSONTheme(data: themeData, colorScheme: colorScheme)
        }
        
        // Logs error if theme data is unavailable, fallback to default theme.
        print("Error: Theme data for ID '\(self.rawValue)' not found. Falling back to default baseline.")
        let defaultThemeID = ThemeManager.shared.defaultThemeID
        
        if let fallbackData = ThemeManager.shared.getThemeData(by: defaultThemeID.rawValue) {
            return CustomJSONTheme(data: fallbackData, colorScheme: colorScheme)
        }
        
        // Fatal error if default theme configuration is also unavailable.
        fatalError("FATAL ERROR: Default theme data not found. App cannot continue without a default theme configuration.")
    }
    
    /// User-friendly display name for the theme.
    var displayName: String {
        ThemeManager.shared.getThemeData(by: self.rawValue)?.displayName ?? "Unknown Theme"
    }
    
    /// Indicates if the theme supports adaptive changes between light/dark modes.
    var isAdaptive: Bool {
        true
    }
    
    /// Default baseline theme identifier (Material 3 baseline).
    static let m3Baseline = ThemeID("apptheme.m3.baseline")
}
