//
//  ContentView.swift
//  Themeable
//
//  Created by Cas Hoefman on 5/15/25.
//  Enhanced for demonstrating themed UI components.
//

import SwiftUI

struct ContentView: View {
    // Environment property providing access to the theme manager
    @Environment(Themer.self) private var themer
    // Tracks the current system color scheme (dark/light mode)
    @Environment(\.colorScheme) private var systemColorScheme

    var body: some View {
        NavigationStack {
            ScrollView {
                VStack(spacing: 20) {
                    // Spacer for initial padding to avoid overlap with navigation bar
                    Spacer(minLength: 20)

                    // Example text demonstrating primary surface theming
                    Text("Hello Themed World!")
                        .font(.largeTitle)
                        .padding()
                        .background(themer.theme.surface)
                        .foregroundColor(themer.theme.onSurface)
                        .cornerRadius(10)
                        .shadow(radius: 5)

                    // Demonstration of a mesh gradient area from the current theme
                    Rectangle()
                        .fill(themer.theme.onboardingBackground)
                        .frame(height: 100)
                        .cornerRadius(10)
                        .overlay(
                            Text("Mesh Gradient Area")
                                .foregroundColor(themer.theme.onBackground)
                        )

                    // MARK: - Enhanced Theme Picker (Carousel with Partial Item Visibility)
                    ScrollView(.horizontal, showsIndicators: false) {
                        HStack(spacing: 12) {
                            ForEach(themer.availableThemes) { themeData in
                                VStack {
                                    Circle()
                                        .fill(LinearGradient(
                                            colors: themeData.lightColors.meshGradientColors.map { Color(hex: $0) },
                                            startPoint: .topLeading,
                                            endPoint: .bottomTrailing
                                        ))
                                        .frame(width: 60, height: 60)
                                        .shadow(radius: themer.userPreferredThemeID.rawValue == themeData.id ? 8 : 2)

                                    Text(themeData.displayName)
                                        .font(.caption)
                                        .foregroundColor(themer.theme.onSurface)
                                }
                                .frame(width: 90) // Fixed width ensures partial visibility
                                .padding(8)
                                .background(
                                    RoundedRectangle(cornerRadius: 12)
                                        .fill(themer.userPreferredThemeID.rawValue == themeData.id ?
                                              themer.theme.primaryContainer :
                                              themer.theme.surfaceContainer)
                                )
                                .onTapGesture {
                                    withAnimation(.spring()) {
                                        themer.setTheme(with: ThemeID(themeData.id))
                                    }
                                }
                            }
                        }
                        .padding(.horizontal)
                    }

                    // MARK: - Additional Themed UI Elements
                    VStack(spacing: 20) {
                        // Primary button demonstrating primary and onPrimary colors
                        Button(action: {}) {
                            Text("Primary Button")
                                .foregroundColor(themer.theme.onPrimary)
                                .padding()
                                .background(themer.theme.primary)
                                .cornerRadius(8)
                        }

                        // Secondary button demonstrating secondary color set
                        Button(action: {}) {
                            Text("Secondary Button")
                                .foregroundColor(themer.theme.onSecondary)
                                .padding()
                                .background(themer.theme.secondary)
                                .cornerRadius(8)
                        }

                        // Text button using primary color for minimal emphasis
                        Button("Text Button") {}
                            .foregroundColor(themer.theme.primary)

                        // Chip/tag example demonstrating secondary container colors
                        Text("Example Chip")
                            .font(.caption)
                            .padding(8)
                            .background(themer.theme.secondaryContainer)
                            .foregroundColor(themer.theme.onSecondaryContainer)
                            .cornerRadius(12)

                        // Error message example demonstrating error handling colors
                        HStack {
                            Image(systemName: "exclamationmark.triangle.fill")
                                .foregroundColor(themer.theme.onErrorContainer)
                            Text("This is an error message.")
                                .foregroundColor(themer.theme.onErrorContainer)
                        }
                        .padding()
                        .background(themer.theme.errorContainer)
                        .cornerRadius(8)

                        // Outlined card demonstrating surface variant and outline colors
                        VStack(alignment: .leading) {
                            Text("Outlined Card")
                                .font(.headline)
                                .foregroundColor(themer.theme.onSurfaceVariant)
                            Text("Subtitle or additional information.")
                                .font(.subheadline)
                                .foregroundColor(themer.theme.onSurfaceVariant.opacity(0.7))
                        }
                        .padding()
                        .background(themer.theme.surfaceContainerLow)
                        .overlay(
                            RoundedRectangle(cornerRadius: 8)
                                .stroke(themer.theme.outlineVariant, lineWidth: 1)
                        )

                        // Inverse surface block example
                        Text("Inverse Surface Example")
                            .foregroundColor(themer.theme.inverseOnSurface)
                            .padding()
                            .background(themer.theme.inverseSurface)
                            .cornerRadius(8)
                    }
                    .padding(.bottom, 30) // Padding at the bottom for visual spacing
                }
                .padding(.horizontal)
                .frame(maxWidth: .infinity) // Ensures content uses full available width
            }
            .background(themer.theme.background) // Set background color from the theme
            .navigationTitle("Color Scheme Demo")
            .toolbarColorScheme(themer.colorScheme == .dark ? .dark : .light, for: .navigationBar)
            .onChange(of: systemColorScheme) { _, newScheme in
                // Respond to color scheme changes by updating the theme
                themer.setColorScheme(newScheme)
            }
        }
    }
}

#Preview {
    ContentView()
        .environment(Themer())
}
