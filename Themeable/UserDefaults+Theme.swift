//
//  UserDefaults+Theme.swift
//  Themeable
//
//  Created by Cas Hoefman on 5/15/25.
//

import Foundation

// MARK: - UserDefaults Extension (Theme Persistence)
/// Extends UserDefaults to conveniently save and retrieve the user's preferred theme identifier.
/// Provides a simple and centralized mechanism for theme persistence across app sessions.
extension UserDefaults {
    
    /// Key used to store and retrieve the theme ID from UserDefaults.
    private static let themeIDKey = "userPreferredThemeID"

    /// Computed property for accessing the user's preferred theme ID as a string.
    var themeIDString: String? {
        get {
            // Retrieve the stored theme ID if available.
            string(forKey: Self.themeIDKey)
        }
        set {
            // Save the new theme ID to UserDefaults.
            set(newValue, forKey: Self.themeIDKey)
        }
    }
}
