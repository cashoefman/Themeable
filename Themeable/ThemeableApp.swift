//
//  ThemeableApp.swift
//  Themeable
//
//  Created by Cas Hoefman on 5/15/25.
//

import SwiftUI

// MARK: - ThemeableApp
/// Main entry point of the Themeable application. Responsible for setting up
/// the environment and managing theme state at the app-wide level.
@main
struct ThemeableApp: App {
    
    /// Instance of the theme manager (Themer) that handles theme selection and color schemes.
    @State private var themerInstance: Themer = Themer()
    
    /// Tracks the current system color scheme (dark or light mode).
    @State private var currentSystemColorScheme: ColorScheme = .light

    var body: some Scene {
        WindowGroup {
            // Root view of the app
            ContentView()
                .background {
                    // Invisible helper view that tracks system color scheme changes
                    ColorSchemeTracker(currentLocalColorScheme: $currentSystemColorScheme)
                        .onChange(of: currentSystemColorScheme) { _, newScheme in
                            // Updates theme colors when the system color scheme changes
                            themerInstance.setColorScheme(newScheme)
                        }
                }
                .onAppear {
                    // Ensures the correct theme is applied upon app launch
                    themerInstance.setColorScheme(currentSystemColorScheme)
                }
        }
        // Injects the Themer instance into the SwiftUI environment, accessible by all views
        .environment(themerInstance)
    }
}
