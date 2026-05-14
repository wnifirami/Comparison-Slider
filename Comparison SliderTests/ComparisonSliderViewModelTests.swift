import XCTest
@testable import Comparison_Slider

@MainActor
final class ComparisonSliderViewModelTests: XCTestCase {

    func testInitialIsDraggingIsFalse() {
        let viewModel = ComparisonSliderViewModel()
        XCTAssertFalse(viewModel.isDragging)
    }

    func testSettingIsDraggingToTrue() {
        let viewModel = ComparisonSliderViewModel()
        viewModel.isDragging = true
        XCTAssertTrue(viewModel.isDragging)
    }

    func testSettingIsDraggingBackToFalse() {
        let viewModel = ComparisonSliderViewModel()
        viewModel.isDragging = true
        viewModel.isDragging = false
        XCTAssertFalse(viewModel.isDragging)
    }
}
