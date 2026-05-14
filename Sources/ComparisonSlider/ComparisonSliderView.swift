import SwiftUI

/// A generic before/after comparison slider.
/// Drop in any two SwiftUI views as `leftView` and `rightView`; drag the handle to reveal.
public struct ComparisonSliderView<LeftView: View, RightView: View>: View {
    @Binding private var splitFraction: CGFloat
    private let configuration: ComparisonSliderConfiguration
    private let leftView: () -> LeftView
    private let rightView: () -> RightView

    @State private var viewModel = ComparisonSliderViewModel()
    @Environment(\.displayScale) private var displayScale

    public init(
        splitFraction: Binding<CGFloat>,
        configuration: ComparisonSliderConfiguration = .default,
        @ViewBuilder leftView: @escaping () -> LeftView,
        @ViewBuilder rightView: @escaping () -> RightView
    ) {
        self._splitFraction = splitFraction
        self.configuration = configuration
        self.leftView = leftView
        self.rightView = rightView
    }

    public var body: some View {
        GeometryReader { geometry in
            let containerWidth = max(geometry.size.width, 1)
            let containerHeight = max(geometry.size.height, 1)
            let pixelSize: CGFloat = 1 / displayScale
            let revealedWidth = ComparisonSliderMath.revealedWidth(
                fraction: splitFraction,
                containerWidth: containerWidth,
                pixelSize: pixelSize
            )
            let handleCenterX = ComparisonSliderMath.handleCenterX(
                fraction: splitFraction,
                containerWidth: containerWidth
            )
            let trackPositionX = min(max(handleCenterX, 0), containerWidth)

            ZStack(alignment: .leading) {
                leftView()
                    .frame(width: containerWidth, height: containerHeight)

                // Right view revealed by masking from the leading edge
                rightView()
                    .frame(width: containerWidth, height: containerHeight)
                    .mask(
                        Rectangle()
                            .frame(width: revealedWidth, height: containerHeight + 2 * pixelSize)
                            .offset(x: -pixelSize, y: -pixelSize)
                            .frame(width: containerWidth, height: containerHeight, alignment: .leading)
                    )
                    .allowsHitTesting(false)

                if configuration.appearance.showsTrack && configuration.spacing.trackWidth > 0 {
                    Rectangle()
                        .fill(configuration.colors.trackColor)
                        .frame(width: configuration.spacing.trackWidth, height: containerHeight)
                        .position(x: trackPositionX, y: containerHeight / 2)
                        .allowsHitTesting(false)
                }

                if configuration.appearance.showsHandle {
                    ComparisonHandleView(
                        centerX: handleCenterX,
                        containerHeight: containerHeight,
                        isDragging: viewModel.isDragging,
                        configuration: configuration
                    )
                    .equatable()
                }

                labelsLayer(containerSize: geometry.size)
            }
            .contentShape(Rectangle())
            .gesture(
                DragGesture(minimumDistance: 0)
                    .onChanged { gesture in
                        viewModel.isDragging = true
                        splitFraction = ComparisonSliderMath.splitFraction(
                            dragX: gesture.location.x,
                            containerWidth: containerWidth
                        )
                    }
                    .onEnded { gesture in
                        splitFraction = ComparisonSliderMath.splitFraction(
                            dragX: gesture.location.x,
                            containerWidth: containerWidth
                        )
                        withAnimation(.spring(response: 0.38, dampingFraction: 0.82)) {
                            viewModel.isDragging = false
                        }
                    }
            )
            .accessibilityElement(children: .ignore)
            .accessibilityLabel("Comparison slider")
            .accessibilityValue(Text("\(Int(splitFraction * 100)) percent"))
        }
    }

    @ViewBuilder
    private func labelsLayer(containerSize: CGSize) -> some View {
        let fadeThreshold = configuration.spacing.labelEdgeFadeThreshold
        let leftOpacity = ComparisonSliderMath.leftLabelOpacity(
            fraction: splitFraction,
            fadeThreshold: fadeThreshold
        )
        let rightOpacity = ComparisonSliderMath.rightLabelOpacity(
            fraction: splitFraction,
            fadeThreshold: fadeThreshold
        )

        ZStack {
            if configuration.appearance.showsLeftLabel && leftOpacity > 0 {
                ComparisonWatermarkLabel(
                    text: configuration.typography.leftLabelText,
                    alignment: .bottomLeading,
                    opacity: leftOpacity,
                    font: configuration.typography.leftLabelFont,
                    textColor: configuration.colors.leftLabelTextColor,
                    backgroundColor: configuration.colors.leftLabelBackgroundColor,
                    shadowColor: configuration.colors.leftLabelShadowColor,
                    outerPadding: configuration.spacing.labelOuterPadding,
                    innerPaddingHorizontal: configuration.spacing.labelInnerPaddingHorizontal,
                    innerPaddingVertical: configuration.spacing.labelInnerPaddingVertical
                )
                .equatable()
            }
            if configuration.appearance.showsRightLabel && rightOpacity > 0 {
                ComparisonWatermarkLabel(
                    text: configuration.typography.rightLabelText,
                    alignment: .bottomTrailing,
                    opacity: rightOpacity,
                    font: configuration.typography.rightLabelFont,
                    textColor: configuration.colors.rightLabelTextColor,
                    backgroundColor: configuration.colors.rightLabelBackgroundColor,
                    shadowColor: configuration.colors.rightLabelShadowColor,
                    outerPadding: configuration.spacing.labelOuterPadding,
                    innerPaddingHorizontal: configuration.spacing.labelInnerPaddingHorizontal,
                    innerPaddingVertical: configuration.spacing.labelInnerPaddingVertical
                )
                .equatable()
            }
        }
        .frame(width: containerSize.width, height: containerSize.height)
        .allowsHitTesting(false)
    }
}
