import SwiftUI

public struct ComparisonSliderTypography: Equatable {
    public var leftLabelText: String
    public var rightLabelText: String
    public var leftLabelFont: Font
    public var rightLabelFont: Font

    public init(
        leftLabelText: String = "Before",
        rightLabelText: String = "After",
        leftLabelFont: Font = .caption.bold(),
        rightLabelFont: Font = .caption.bold()
    ) {
        self.leftLabelText = leftLabelText
        self.rightLabelText = rightLabelText
        self.leftLabelFont = leftLabelFont
        self.rightLabelFont = rightLabelFont
    }
}
