import Foundation

enum ComparisonSliderMath {
    static func clampedFraction(_ value: CGFloat) -> CGFloat {
        min(max(value, 0), 1)
    }

    static func splitFraction(dragX: CGFloat, containerWidth: CGFloat) -> CGFloat {
        clampedFraction(dragX / max(containerWidth, 1))
    }

    static func handleCenterX(fraction: CGFloat, containerWidth: CGFloat) -> CGFloat {
        (fraction * containerWidth).rounded()
    }

    static func revealedWidth(fraction: CGFloat, containerWidth: CGFloat, pixelSize: CGFloat) -> CGFloat {
        clampedFraction(fraction) * containerWidth + 2 * pixelSize
    }

    static func leftLabelOpacity(fraction: CGFloat, fadeThreshold: CGFloat) -> CGFloat {
        fraction <= fadeThreshold ? 1 : max(0, 1 - fraction)
    }

    static func rightLabelOpacity(fraction: CGFloat, fadeThreshold: CGFloat) -> CGFloat {
        fraction >= 1 - fadeThreshold ? 1 : max(0, fraction)
    }
}
