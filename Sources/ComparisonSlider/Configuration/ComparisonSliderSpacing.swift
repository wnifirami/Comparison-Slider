import Foundation

public struct ComparisonSliderSpacing: Equatable {
    public var trackWidth: CGFloat
    public var handleIconSize: CGFloat
    public var handleIconSpacing: CGFloat
    public var handleShadowRadius: CGFloat
    public var labelOuterPadding: CGFloat
    public var labelInnerPaddingHorizontal: CGFloat
    public var labelInnerPaddingVertical: CGFloat
    public var labelEdgeFadeThreshold: CGFloat

    public init(
        trackWidth: CGFloat = 2,
        handleIconSize: CGFloat = 22,
        handleIconSpacing: CGFloat = 4,
        handleShadowRadius: CGFloat = 6,
        labelOuterPadding: CGFloat = 8,
        labelInnerPaddingHorizontal: CGFloat = 10,
        labelInnerPaddingVertical: CGFloat = 5,
        labelEdgeFadeThreshold: CGFloat = 0.02
    ) {
        self.trackWidth = trackWidth
        self.handleIconSize = handleIconSize
        self.handleIconSpacing = handleIconSpacing
        self.handleShadowRadius = handleShadowRadius
        self.labelOuterPadding = labelOuterPadding
        self.labelInnerPaddingHorizontal = labelInnerPaddingHorizontal
        self.labelInnerPaddingVertical = labelInnerPaddingVertical
        self.labelEdgeFadeThreshold = labelEdgeFadeThreshold
    }
}
