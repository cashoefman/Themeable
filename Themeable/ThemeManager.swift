//
//  ThemeManager.swift
//  Themeable
//
//  Created by Cas Hoefman on 5/15/25.
//

import Foundation

// MARK: - ThemeManager
/// Singleton class responsible for loading, storing, and providing access to all available themes in the app.
class ThemeManager {
    
    /// Shared instance of ThemeManager, following the Singleton design pattern.
    static let shared = ThemeManager()

    /// Array holding all loaded theme data objects from the JSON configuration.
    private(set) var allLoadedThemes: [CustomThemeData] = []
    
    /// Dictionary mapping theme identifiers to their corresponding theme data for quick access.
    private var themesByIdentifier: [String: CustomThemeData] = [:]

    /// Default theme identifier used for fallback when a specified theme isn't found.
    let defaultThemeID: ThemeID = .m3Baseline

    /// Private initializer ensures ThemeManager can only be instantiated internally, enforcing Singleton pattern.
    private init() {
        loadThemes()
    }

    /// Loads themes from a JSON file using the CustomThemeLoader class.
    private func loadThemes() {
        // Load and decode themes from the JSON resource file.
        allLoadedThemes = CustomThemeLoader.loadThemes()
        
        // Populate themesByIdentifier dictionary for quick lookups.
        for theme in allLoadedThemes {
            themesByIdentifier[theme.id] = theme
        }
    }

    /// Retrieves theme data based on a given theme identifier.
    /// - Parameter id: The identifier for the desired theme.
    /// - Returns: A `CustomThemeData` instance if found, otherwise `nil`.
    func getThemeData(by id: String) -> CustomThemeData? {
        return themesByIdentifier[id]
    }

    /// Provides a list of all available theme identifiers.
    var allThemeIDs: [ThemeID] {
        return allLoadedThemes.map { ThemeID(rawValue: $0.id) }
    }
}

