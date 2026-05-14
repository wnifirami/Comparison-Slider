import XCTest
@testable import Comparison_Slider

@MainActor
final class ComparisonSliderConfigurationTests: XCTestCase {

    // MARK: - Default values

    func testDefaultAppearanceShowsTrack() {
        XCTAssertTrue(ComparisonSliderConfiguration.default.appearance.showsTrack)
    }

    func testDefaultAppearanceShowsHandle() {
        XCTAssertTrue(ComparisonSliderConfiguration.default.appearance.showsHandle)
    }

    func testDefaultAppearanceShowsLeftLabel() {
        XCTAssertTrue(ComparisonSliderConfiguration.default.appearance.showsLeftLabel)
    }

    func testDefaultAppearanceShowsRightLabel() {
        XCTAssertTrue(ComparisonSliderConfiguration.default.appearance.showsRightLabel)
    }

    func testDefaultTypographyLeftLabelText() {
        XCTAssertEqual(ComparisonSliderConfiguration.default.typography.leftLabelText, "Before")
    }

    func testDefaultTypographyRightLabelText() {
        XCTAssertEqual(ComparisonSliderConfiguration.default.typography.rightLabelText, "After")
    }

    func testDefaultSpacingTrackWidth() {
        XCTAssertEqual(ComparisonSliderConfiguration.default.spacing.trackWidth, 2)
    }

    func testDefaultSpacingHandleIconSize() {
        XCTAssertEqual(ComparisonSliderConfiguration.default.spacing.handleIconSize, 22)
    }

    // MARK: - Value semantics

    func testMutatingAppearanceCopyDoesNotAffectOriginal() {
        let original = ComparisonSliderConfiguration.default
        var copy = original
        copy.appearance.showsHandle = false
        XCTAssertTrue(original.appearance.showsHandle)
        XCTAssertFalse(copy.appearance.showsHandle)
    }

    func testMutatingTypographyCopyDoesNotAffectOriginal() {
        let original = ComparisonSliderConfiguration.default
        var copy = original
        copy.typography.leftLabelText = "Custom"
        XCTAssertEqual(original.typography.leftLabelText, "Before")
        XCTAssertEqual(copy.typography.leftLabelText, "Custom")
    }

    func testMutatingSpacingCopyDoesNotAffectOriginal() {
        let original = ComparisonSliderConfiguration.default
        var copy = original
        copy.spacing.trackWidth = 10
        XCTAssertEqual(original.spacing.trackWidth, 2)
        XCTAssertEqual(copy.spacing.trackWidth, 10)
    }

    // MARK: - Equatable

    func testDefaultConfigurationsAreEqual() {
        XCTAssertEqual(ComparisonSliderConfiguration.default, ComparisonSliderConfiguration.default)
    }

    func testConfigurationsWithDifferentAppearanceAreNotEqual() {
        let first = ComparisonSliderConfiguration.default
        var second = ComparisonSliderConfiguration.default
        second.appearance.showsHandle = false
        XCTAssertNotEqual(first, second)
    }

    func testConfigurationsWithDifferentTypographyAreNotEqual() {
        let first = ComparisonSliderConfiguration.default
        var second = ComparisonSliderConfiguration.default
        second.typography.leftLabelText = "Custom"
        XCTAssertNotEqual(first, second)
    }

    func testConfigurationsWithDifferentSpacingAreNotEqual() {
        let first = ComparisonSliderConfiguration.default
        var second = ComparisonSliderConfiguration.default
        second.spacing.trackWidth = 10
        XCTAssertNotEqual(first, second)
    }
}
