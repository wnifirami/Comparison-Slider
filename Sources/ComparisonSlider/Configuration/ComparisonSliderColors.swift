import SwiftUI

public struct ComparisonSliderColors: Equatable {
    public var trackColor: Color
    public var handleIconColor: Color
    public var handleBackgroundColor: Color
    public var leftLabelTextColor: Color
    public var rightLabelTextColor: Color
    public var leftLabelBackgroundColor: Color
    public var rightLabelBackgroundColor: Color
    public var leftLabelShadowColor: Color
    public var rightLabelShadowColor: Color

    public init(
        trackColor: Color = .white.opacity(0.9),
        handleIconColor: Color = .white,
        handleBackgroundColor: Color = .white.opacity(0.25),
        leftLabelTextColor: Color = .white,
        rightLabelTextColor: Color = .white,
        leftLabelBackgroundColor: Color = .black.opacity(0.30),
        rightLabelBackgroundColor: Color = .black.opacity(0.30),
        leftLabelShadowColor: Color = .black.opacity(0.55),
        rightLabelShadowColor: Color = .black.opacity(0.55)
    ) {
        self.trackColor = trackColor
        self.handleIconColor = handleIconColor
        self.handleBackgroundColor = handleBackgroundColor
        self.leftLabelTextColor = leftLabelTextColor
        self.rightLabelTextColor = rightLabelTextColor
        self.leftLabelBackgroundColor = leftLabelBackgroundColor
        self.rightLabelBackgroundColor = rightLabelBackgroundColor
        self.leftLabelShadowColor = leftLabelShadowColor
        self.rightLabelShadowColor = rightLabelShadowColor
    }
}
