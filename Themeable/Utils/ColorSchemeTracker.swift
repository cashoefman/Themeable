//
//  ColorSchemeTracker.swift
//  Themeable
//
//  Created by Cas Hoefman on 5/15/25.
//

import SwiftUI

/// A helper view that tracks changes in the device's color scheme (light/dark mode)
/// and propagates these changes via a binding to other parts of the app.
struct ColorSchemeTracker: View {
    
    /// System-wide color scheme provided by SwiftUI environment (light or dark).
    @Environment(\.colorScheme) private var systemColorScheme
    
    /// Binding to a local variable to propagate color scheme changes.
    @Binding var currentLocalColorScheme: ColorScheme

    var body: some View {
        // Invisible view used only to track changes to the system color scheme.
        Color.clear
            .onAppear {
                // Set the initial color scheme when the view appears.
                currentLocalColorScheme = systemColorScheme
            }
            .onChange(of: systemColorScheme) { oldScheme, newScheme in
                // Update the binding whenever the system color scheme changes.
                currentLocalColorScheme = newScheme
            }
    }
}
