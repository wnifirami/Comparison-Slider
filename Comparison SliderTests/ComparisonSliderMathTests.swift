import XCTest
@testable import Comparison_Slider

@MainActor
final class ComparisonSliderMathTests: XCTestCase {

    // MARK: - clampedFraction

    func testClampedFractionAtZeroReturnsZero() {
        XCTAssertEqual(ComparisonSliderMath.clampedFraction(0), 0)
    }

    func testClampedFractionAtOneReturnsOne() {
        XCTAssertEqual(ComparisonSliderMath.clampedFraction(1), 1)
    }

    func testClampedFractionAtMidpointPassesThrough() {
        XCTAssertEqual(ComparisonSliderMath.clampedFraction(0.5), 0.5)
    }

    func testClampedFractionBelowZeroReturnsZero() {
        XCTAssertEqual(ComparisonSliderMath.clampedFraction(-0.5), 0)
    }

    func testClampedFractionAboveOneReturnsOne() {
        XCTAssertEqual(ComparisonSliderMath.clampedFraction(1.5), 1)
    }

    // MARK: - splitFraction

    func testSplitFractionAtContainerCenter() {
        XCTAssertEqual(ComparisonSliderMath.splitFraction(dragX: 150, containerWidth: 300), 0.5)
    }

    func testSplitFractionAtLeadingEdge() {
        XCTAssertEqual(ComparisonSliderMath.splitFraction(dragX: 0, containerWidth: 300), 0)
    }

    func testSplitFractionAtTrailingEdge() {
        XCTAssertEqual(ComparisonSliderMath.splitFraction(dragX: 300, containerWidth: 300), 1)
    }

    func testSplitFractionClampsNegativeDragX() {
        XCTAssertEqual(ComparisonSliderMath.splitFraction(dragX: -50, containerWidth: 300), 0)
    }

    func testSplitFractionClampsDragXBeyondWidth() {
        XCTAssertEqual(ComparisonSliderMath.splitFraction(dragX: 400, containerWidth: 300), 1)
    }

    func testSplitFractionWithZeroContainerWidthReturnsZero() {
        XCTAssertEqual(ComparisonSliderMath.splitFraction(dragX: 100, containerWidth: 0), 0)
    }

    // MARK: - handleCenterX

    func testHandleCenterXAtZeroFraction() {
        XCTAssertEqual(ComparisonSliderMath.handleCenterX(fraction: 0, containerWidth: 300), 0)
    }

    func testHandleCenterXAtOneFraction() {
        XCTAssertEqual(ComparisonSliderMath.handleCenterX(fraction: 1, containerWidth: 300), 300)
    }

    func testHandleCenterXAtMidpoint() {
        XCTAssertEqual(ComparisonSliderMath.handleCenterX(fraction: 0.5, containerWidth: 300), 150)
    }

    // MARK: - revealedWidth

    func testRevealedWidthAtZeroFractionEqualsBleedOnly() {
        let pixelSize: CGFloat = 0.5
        let result = ComparisonSliderMath.revealedWidth(fraction: 0, containerWidth: 300, pixelSize: pixelSize)
        XCTAssertEqual(result, 2 * pixelSize, accuracy: 0.001)
    }

    func testRevealedWidthAtOneFractionEqualsFullWidthPlusBleed() {
        let pixelSize: CGFloat = 0.5
        let result = ComparisonSliderMath.revealedWidth(fraction: 1, containerWidth: 300, pixelSize: pixelSize)
        XCTAssertEqual(result, 300 + 2 * pixelSize, accuracy: 0.001)
    }

    func testRevealedWidthAtMidpoint() {
        let pixelSize: CGFloat = 0.5
        let result = ComparisonSliderMath.revealedWidth(fraction: 0.5, containerWidth: 300, pixelSize: pixelSize)
        XCTAssertEqual(result, 150 + 2 * pixelSize, accuracy: 0.001)
    }

    // MARK: - leftLabelOpacity

    func testLeftLabelOpacityIsOneAtZeroFraction() {
        XCTAssertEqual(ComparisonSliderMath.leftLabelOpacity(fraction: 0, fadeThreshold: 0.02), 1)
    }

    func testLeftLabelOpacityIsOneWhenBelowFadeThreshold() {
        XCTAssertEqual(ComparisonSliderMath.leftLabelOpacity(fraction: 0.01, fadeThreshold: 0.02), 1)
    }

    func testLeftLabelOpacityIsZeroAtFractionOne() {
        XCTAssertEqual(ComparisonSliderMath.leftLabelOpacity(fraction: 1, fadeThreshold: 0.02), 0)
    }

    func testLeftLabelOpacityAtMidpoint() {
        let opacity = ComparisonSliderMath.leftLabelOpacity(fraction: 0.5, fadeThreshold: 0.02)
        XCTAssertEqual(opacity, 0.5, accuracy: 0.001)
    }

    // MARK: - rightLabelOpacity

    func testRightLabelOpacityIsZeroAtFractionZero() {
        XCTAssertEqual(ComparisonSliderMath.rightLabelOpacity(fraction: 0, fadeThreshold: 0.02), 0)
    }

    func testRightLabelOpacityIsOneAtFractionOne() {
        XCTAssertEqual(ComparisonSliderMath.rightLabelOpacity(fraction: 1, fadeThreshold: 0.02), 1)
    }

    func testRightLabelOpacityIsOneWhenAboveFadeThreshold() {
        XCTAssertEqual(ComparisonSliderMath.rightLabelOpacity(fraction: 0.99, fadeThreshold: 0.02), 1)
    }

    func testRightLabelOpacityAtMidpoint() {
        let opacity = ComparisonSliderMath.rightLabelOpacity(fraction: 0.5, fadeThreshold: 0.02)
        XCTAssertEqual(opacity, 0.5, accuracy: 0.001)
    }
}
