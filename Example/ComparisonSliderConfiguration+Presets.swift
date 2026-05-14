import SwiftUI

extension ComparisonSliderConfiguration {
    static var ocean: ComparisonSliderConfiguration {
        var configuration = ComparisonSliderConfiguration.default
        configuration.colors.trackColor = Color(red: 0.04, green: 0.65, blue: 0.91)
        configuration.colors.handleIconColor = Color(red: 0.04, green: 0.65, blue: 0.91)
        configuration.colors.handleBackgroundColor = Color(red: 0.04, green: 0.65, blue: 0.91).opacity(0.25)
        return configuration
    }

    static var sunset: ComparisonSliderConfiguration {
        var configuration = ComparisonSliderConfiguration.default
        configuration.colors.trackColor = Color(red: 1.0, green: 0.45, blue: 0.2)
        configuration.colors.handleIconColor = Color(red: 1.0, green: 0.45, blue: 0.2)
        configuration.colors.handleBackgroundColor = Color(red: 1.0, green: 0.45, blue: 0.2).opacity(0.25)
        return configuration
    }

    static var minimal: ComparisonSliderConfiguration {
        var configuration = ComparisonSliderConfiguration.default
        configuration.appearance.showsHandle = false
        configuration.appearance.showsLeftLabel = false
        configuration.appearance.showsRightLabel = false
        configuration.spacing.trackWidth = 1
        configuration.colors.trackColor = .white
        return configuration
    }
}
