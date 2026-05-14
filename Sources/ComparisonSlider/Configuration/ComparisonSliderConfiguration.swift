import SwiftUI

/// The single public configuration type for `ComparisonSliderView`.
/// Start from `.default` and mutate only what you need.
public struct ComparisonSliderConfiguration: Equatable {
    public var colors: ComparisonSliderColors
    public var typography: ComparisonSliderTypography
    public var spacing: ComparisonSliderSpacing
    public var appearance: ComparisonSliderAppearance

    public static let `default` = ComparisonSliderConfiguration()

    public init(
        colors: ComparisonSliderColors = ComparisonSliderColors(),
        typography: ComparisonSliderTypography = ComparisonSliderTypography(),
        spacing: ComparisonSliderSpacing = ComparisonSliderSpacing(),
        appearance: ComparisonSliderAppearance = ComparisonSliderAppearance()
    ) {
        self.colors = colors
        self.typography = typography
        self.spacing = spacing
        self.appearance = appearance
    }
}
