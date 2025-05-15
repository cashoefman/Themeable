///
//  EnvironmentValues+Themer.swift
//  Themeable
//
//  Created by Cas Hoefman on 5/15/25.
//

import SwiftUI

// MARK: - ThemerKey
/// Custom environment key used to inject and access the Themer instance throughout the SwiftUI view hierarchy.
private struct ThemerKey: EnvironmentKey {
    /// Provides a default Themer instance for use when none has been explicitly set.
    static var defaultValue: Themer = Themer()
}

// MARK: - EnvironmentValues Extension
/// Extends SwiftUI's EnvironmentValues to include a theme management object (Themer).
extension EnvironmentValues {
    /// Provides a convenient accessor to get and set the Themer instance within the SwiftUI environment.
    var themer: Themer {
        get { self[ThemerKey.self] }
        set { self[ThemerKey.self] = newValue }
    }
}
