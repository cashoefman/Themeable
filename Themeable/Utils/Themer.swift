//
//  Themer.swift
//  Themeable
//
//  Created by Cas Hoefman on 5/15/25.
//

import SwiftUI
import Combine

// MARK: - Themer
/// An observable object responsible for managing the current theme and responding to color scheme changes.
/// It interacts closely with ThemeManager to retrieve theme details and persist user preferences.
@Observable
class Themer {
    
    /// The user's preferred theme identifier (ThemeID), persisted across sessions.
    @ObservationIgnored private(set) var userPreferredThemeID: ThemeID
    
    /// The current color scheme (dark or light mode) in use by the app.
    private(set) var colorScheme: ColorScheme = .light
    
    /// The active theme instance conforming to ThemeProtocol.
    private(set) var theme: ThemeProtocol

    /// A list of all available custom themes loaded from configuration.
    var availableThemes: [CustomThemeData] {
        ThemeManager.shared.allLoadedThemes
    }

    /// Initializes a new Themer instance, loading user preferences and setting initial theme state.
    init() {
        // Ensure ThemeManager singleton is initialized.
        _ = ThemeManager.shared

        // Load the user's previously saved theme ID from UserDefaults, fallback to default if unavailable.
        let savedThemeIDString = UserDefaults.standard.themeIDString
        self.userPreferredThemeID = ThemeID(rawValue: savedThemeIDString ?? ThemeManager.shared.defaultThemeID.rawValue)

        // Ensure the saved theme ID is valid; if not, fallback to default.
        if !ThemeManager.shared.allThemeIDs.contains(userPreferredThemeID) {
            print("Warning: User's saved theme ID '\(userPreferredThemeID.rawValue)' not found. Resetting to default.")
            self.userPreferredThemeID = ThemeManager.shared.defaultThemeID
        }

        // Set the initial theme based on the user's preferred ID and initial color scheme.
        self.theme = self.userPreferredThemeID.theme(for: .light)
    }

    /// Updates the current theme with a new ThemeID, saving the user's preference and applying animations.
    /// - Parameter newThemeID: The new theme identifier to apply.
    func setTheme(with newThemeID: ThemeID) {
        withAnimation {
            self.userPreferredThemeID = newThemeID
            self.theme = newThemeID.theme(for: self.colorScheme)
            UserDefaults.standard.themeIDString = self.userPreferredThemeID.rawValue
        }
    }

    /// Updates the active color scheme (light or dark) and applies the appropriate theme variation.
    /// - Parameter newColorScheme: The new color scheme to apply.
    func setColorScheme(_ newColorScheme: ColorScheme) {
        if self.colorScheme != newColorScheme {
            withAnimation {
                self.colorScheme = newColorScheme
                self.theme = userPreferredThemeID.theme(for: newColorScheme)
            }
        }
    }
}
