//
//  ThemeProtocol.swift
//  Themeable
//
//  Created by Cas Hoefman on 5/15/25.
//

import SwiftUI

// MARK: - ThemeProtocol
/// Protocol defining a structured set of colors and properties required by any theme implementation.
/// This ensures consistency and standardization across various themes within the application.
protocol ThemeProtocol {
    
    // MARK: Primary Colors
    /// Primary color used prominently in UI components (e.g., buttons, highlights).
    var primary: Color { get }
    /// Color displayed over the primary color for readability.
    var onPrimary: Color { get }
    /// Container background color related to the primary color, used for surfaces or backgrounds.
    var primaryContainer: Color { get }
    /// Foreground color used over the primary container.
    var onPrimaryContainer: Color { get }

    // MARK: Secondary Colors
    /// Secondary color used for accentuating and complementing the primary color.
    var secondary: Color { get }
    /// Color displayed over the secondary color.
    var onSecondary: Color { get }
    /// Container background color related to the secondary color.
    var secondaryContainer: Color { get }
    /// Foreground color used over the secondary container.
    var onSecondaryContainer: Color { get }

    // MARK: Tertiary Colors
    /// Tertiary accent color, providing additional color variety and depth.
    var tertiary: Color { get }
    /// Color displayed over the tertiary color.
    var onTertiary: Color { get }
    /// Container background color related to the tertiary color.
    var tertiaryContainer: Color { get }
    /// Foreground color used over the tertiary container.
    var onTertiaryContainer: Color { get }

    // MARK: Error Colors
    /// Color used to indicate errors or alerts in the UI.
    var error: Color { get }
    /// Color displayed over the error color for readability.
    var onError: Color { get }
    /// Background container color used specifically for error messages or alerts.
    var errorContainer: Color { get }
    /// Foreground color used over the error container.
    var onErrorContainer: Color { get }

    // MARK: Neutral Colors
    /// General app background color.
    var background: Color { get }
    /// Foreground text and elements color suitable for use on the background color.
    var onBackground: Color { get }
    /// Surface color for cards, sheets, and other elevated components.
    var surface: Color { get }
    /// Foreground color suitable for use on the surface color.
    var onSurface: Color { get }
    /// Variant of surface used to provide additional depth or distinction.
    var surfaceVariant: Color { get }
    /// Foreground color for use on the surface variant.
    var onSurfaceVariant: Color { get }
    /// Standard color used for outlines around UI elements.
    var outline: Color { get }
    /// Variant color used for outlines needing additional distinction.
    var outlineVariant: Color { get }
    /// Overlay color typically used for scrims or darkening overlays.
    var scrim: Color { get }
    /// Surface color used for inverse or contrasting areas of the UI.
    var inverseSurface: Color { get }
    /// Foreground color suitable for inverse surfaces.
    var inverseOnSurface: Color { get }
    /// Inverse primary color used for emphasizing inverted color schemes.
    var inversePrimary: Color { get }
    /// Surface color variant used to indicate a less emphasized state.
    var surfaceDim: Color { get }
    /// Bright surface variant for emphasizing certain UI areas.
    var surfaceBright: Color { get }
    /// Lowest emphasis surface container variant.
    var surfaceContainerLowest: Color { get }
    /// Low emphasis surface container variant.
    var surfaceContainerLow: Color { get }
    /// Standard surface container variant.
    var surfaceContainer: Color { get }
    /// High emphasis surface container variant.
    var surfaceContainerHigh: Color { get }
    /// Highest emphasis surface container variant.
    var surfaceContainerHighest: Color { get }

    // MARK: App-Specific Components
    /// Colors specifically used for generating mesh gradients, typically for onboarding screens.
    var meshGradientColors: [Color] { get }
    /// Mesh gradient configuration, usually for background visuals on onboarding screens.
    var onboardingBackground: MeshGradient { get }
    /// Background color specifically used for navigation buttons.
    var navigationButtonBackground: Color { get }
    /// Tint color used for navigation elements.
    var navigationTint: Color { get }
}
