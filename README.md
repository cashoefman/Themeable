# Themeable

Themeable is a SwiftUI demonstration app showcasing a structured, dynamic, and easily maintainable theming architecture. It enables developers to implement and manage themes in their SwiftUI applications efficiently.

This app serves as an interactive example of how themes can be managed and switched at runtime, providing practical insights into implementing theme management in a real-world scenario.

---

## Features

* **Dynamic Theme Switching:** Quickly toggle between themes to see immediate UI updates.
* **JSON-based Configuration:** Themes are loaded from external JSON files, making updates and maintenance straightforward.
* **Adaptive Color Schemes:** Automatic handling of dark and light modes, ensuring optimal appearance across system color schemes.
* **Carousel Theme Picker:** An engaging and visually intuitive horizontal scrollable carousel clearly indicating available themes and enhancing user experience.
* **Comprehensive Themed UI Examples:** Demonstrates various UI elements including buttons, chips, cards, error messages, and inverse color blocks, fully themed and responsive.

---

## Project Structure

### Core Components

* **Themer.swift:**

  * Manages current theme and handles color scheme updates.

* **ThemeManager.swift:**

  * Loads theme configurations from JSON files and provides access to theme data.

* **ThemeProtocol.swift:**

  * Defines a standardized interface for theme implementations.

* **CustomJSONTheme:**

  * Concrete implementation of themes using JSON configuration data.

* **EnvironmentValues+Themer.swift:**

  * Injects the theming manager into SwiftUI's environment.

* **UserDefaults+Theme.swift:**

  * Provides simple persistence for user-selected themes.

* **ThemeImplementations.swift:**

  * Utility extension for creating `Color` objects from hexadecimal strings.

---

## Getting Started

### Prerequisites

* Xcode 16.3+
* iOS 18.0+

### Installation

1. Clone the repository:

```bash
git clone https://github.com/yourusername/Themeable.git
```

2. Open the project in Xcode.

3. Run the project in the simulator or on a physical device running iOS 18 or later.

---

## How It Works

### Theme Definitions

Themes are defined externally in a JSON file (`AppThemes.json`) that specifies colors for both light and dark modes, and other theme-specific details such as mesh gradient colors.

### Theme Selection

The carousel picker in the main view allows users to intuitively select themes. The current selection is persisted via UserDefaults, ensuring user preference retention across app launches.

### Dynamic Updates

SwiftUI’s reactive nature combined with `@Observable` properties in `Themer` automatically applies theme changes throughout the app, providing immediate feedback and seamless UI updates.

---

## Contributions

Contributions are welcome! Feel free to open issues or submit pull requests to enhance the app further or to suggest improvements to the theming architecture.

---

## Special Thanks

This project was inspired by and built upon the insightful article by [Sebastian Zwicker](https://medium.com/@szwicker): [Create a Simple Theming Architecture with SwiftUI](https://medium.com/@szwicker/create-a-simple-theming-architecture-with-swiftui-510df4c20c8e).

---

## License

Themeable is open-source software licensed under the MIT license. See the [LICENSE](LICENSE) file for more information.
