//
//  ThemeData.swift
//  Themeable
//
//  Created by Cas Hoefman on 5/15/25.
//

import SwiftUI
import Foundation

// MARK: - ColorHexes
// Struct to define color hex strings for various UI elements within a theme.
struct ColorHexes: Codable {
    let primary: String
    let onPrimary: String
    let primaryContainer: String
    let onPrimaryContainer: String
    let secondary: String
    let onSecondary: String
    let secondaryContainer: String
    let onSecondaryContainer: String
    let tertiary: String
    let onTertiary: String
    let tertiaryContainer: String
    let onTertiaryContainer: String
    let error: String
    let onError: String
    let errorContainer: String
    let onErrorContainer: String
    let background: String
    let onBackground: String
    let surface: String
    let onSurface: String
    let surfaceVariant: String
    let onSurfaceVariant: String
    let outline: String
    let outlineVariant: String
    let scrim: String
    let inverseSurface: String
    let inverseOnSurface: String
    let inversePrimary: String
    let surfaceDim: String
    let surfaceBright: String
    let surfaceContainerLowest: String
    let surfaceContainerLow: String
    let surfaceContainer: String
    let surfaceContainerHigh: String
    let surfaceContainerHighest: String

    let meshGradientColors: [String] // Colors used for creating mesh gradients
}

// MARK: - CustomThemeData
// Represents a theme with specific identifiers, display names, and color configurations for light and dark modes.
struct CustomThemeData: Codable, Identifiable {
    let id: String
    let displayName: String
    let lightColors: ColorHexes
    let darkColors: ColorHexes
}

// MARK: - CustomThemeLoader
// Responsible for loading and decoding theme data from a JSON file.
class CustomThemeLoader {
    static func loadThemes() -> [CustomThemeData] {
        guard let url = Bundle.main.url(forResource: "AppThemes", withExtension: "json") else {
            print("❌ Error: AppThemes.json NOT FOUND in app bundle.")
            return []
        }

        do {
            let data = try Data(contentsOf: url)
            let decoder = JSONDecoder()
            let themes = try decoder.decode([CustomThemeData].self, from: data)

            return themes
        } catch {
            print("❌ Error loading themes: \(error.localizedDescription)")
            return []
        }
    }
}

// MARK: - CustomJSONTheme
// Implements the ThemeProtocol using the data loaded from JSON, providing SwiftUI colors for UI elements.
struct CustomJSONTheme: ThemeProtocol {
    private let themeId: String
    private let colorSet: ColorHexes
    private let currentColorScheme: ColorScheme

    init(data: CustomThemeData, colorScheme: ColorScheme) {
        self.themeId = data.id
        self.colorSet = colorScheme == .dark ? data.darkColors : data.lightColors
        self.currentColorScheme = colorScheme
    }

    // Theme colors for UI elements
    var primary: Color { Color(hex: colorSet.primary) }
    var onPrimary: Color { Color(hex: colorSet.onPrimary) }
    var primaryContainer: Color { Color(hex: colorSet.primaryContainer) }
    var onPrimaryContainer: Color { Color(hex: colorSet.onPrimaryContainer) }

    var secondary: Color { Color(hex: colorSet.secondary) }
    var onSecondary: Color { Color(hex: colorSet.onSecondary) }
    var secondaryContainer: Color { Color(hex: colorSet.secondaryContainer) }
    var onSecondaryContainer: Color { Color(hex: colorSet.onSecondaryContainer) }

    var tertiary: Color { Color(hex: colorSet.tertiary) }
    var onTertiary: Color { Color(hex: colorSet.onTertiary) }
    var tertiaryContainer: Color { Color(hex: colorSet.tertiaryContainer) }
    var onTertiaryContainer: Color { Color(hex: colorSet.onTertiaryContainer) }

    var error: Color { Color(hex: colorSet.error) }
    var onError: Color { Color(hex: colorSet.onError) }
    var errorContainer: Color { Color(hex: colorSet.errorContainer) }
    var onErrorContainer: Color { Color(hex: colorSet.onErrorContainer) }

    var background: Color { Color(hex: colorSet.background) }
    var onBackground: Color { Color(hex: colorSet.onBackground) }
    var surface: Color { Color(hex: colorSet.surface) }
    var onSurface: Color { Color(hex: colorSet.onSurface) }
    var surfaceVariant: Color { Color(hex: colorSet.surfaceVariant) }
    var onSurfaceVariant: Color { Color(hex: colorSet.onSurfaceVariant) }
    var outline: Color { Color(hex: colorSet.outline) }
    var outlineVariant: Color { Color(hex: colorSet.outlineVariant) }
    var scrim: Color { Color(hex: colorSet.scrim) }
    var inverseSurface: Color { Color(hex: colorSet.inverseSurface) }
    var inverseOnSurface: Color { Color(hex: colorSet.inverseOnSurface) }
    var inversePrimary: Color { Color(hex: colorSet.inversePrimary) }
    var surfaceDim: Color { Color(hex: colorSet.surfaceDim) }
    var surfaceBright: Color { Color(hex: colorSet.surfaceBright) }
    var surfaceContainerLowest: Color { Color(hex: colorSet.surfaceContainerLowest) }
    var surfaceContainerLow: Color { Color(hex: colorSet.surfaceContainerLow) }
    var surfaceContainer: Color { Color(hex: colorSet.surfaceContainer) }
    var surfaceContainerHigh: Color { Color(hex: colorSet.surfaceContainerHigh) }
    var surfaceContainerHighest: Color { Color(hex: colorSet.surfaceContainerHighest) }

    // Colors specifically for generating mesh gradients
    var meshGradientColors: [Color] {
        return colorSet.meshGradientColors.map { Color(hex: $0) }
    }

    // Mesh gradient configuration for onboarding backgrounds
    var onboardingBackground: MeshGradient {
        MeshGradient(width: 3, height: 3, points: [
            .init(0, 0), .init(0.5, 0), .init(1, 0),
            .init(0, 0.5), .init(0.5, 0.5), .init(1, 0.5),
            .init(0, 1), .init(0.5, 1), .init(1, 1)
        ], colors: Array(meshGradientColors.prefix(9)))
    }

    var navigationButtonBackground: Color { primaryContainer.opacity(0.2) }
    var navigationTint: Color { primary }
}
