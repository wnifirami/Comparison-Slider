import SwiftUI

struct ComparisonHandleView: View, Equatable {
    let centerX: CGFloat
    let containerHeight: CGFloat
    let isDragging: Bool
    let configuration: ComparisonSliderConfiguration

    static func == (lhs: Self, rhs: Self) -> Bool {
        lhs.centerX == rhs.centerX &&
        lhs.containerHeight == rhs.containerHeight &&
        lhs.isDragging == rhs.isDragging &&
        lhs.configuration == rhs.configuration
    }

    var body: some View {
        HStack(spacing: configuration.spacing.handleIconSpacing) {
            Image(systemName: "chevron.left.circle.fill")
                .resizable()
                .scaledToFit()
                .frame(width: configuration.spacing.handleIconSize, height: configuration.spacing.handleIconSize)
                .foregroundColor(configuration.colors.handleIconColor)

            Image(systemName: "chevron.right.circle.fill")
                .resizable()
                .scaledToFit()
                .frame(width: configuration.spacing.handleIconSize, height: configuration.spacing.handleIconSize)
                .foregroundColor(configuration.colors.handleIconColor)
        }
        .padding(8)
        .background(configuration.colors.handleBackgroundColor, in: Capsule())
        .scaleEffect(isDragging ? 1.12 : 1.0)
        .shadow(
            color: .black.opacity(0.3),
            radius: isDragging ? 8 : configuration.spacing.handleShadowRadius,
            y: isDragging ? 4 : 2
        )
        .animation(.spring(response: 0.38, dampingFraction: 0.82), value: isDragging)
        .position(x: centerX, y: containerHeight / 2)
        .allowsHitTesting(false)
        .accessibilityHidden(true)
    }
}
