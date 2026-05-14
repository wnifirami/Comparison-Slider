import XCTest

final class Comparison_SliderUITests: XCTestCase {

    private var app: XCUIApplication!

    override func setUpWithError() throws {
        continueAfterFailure = false
        app = XCUIApplication()
        app.launch()
    }

    override func tearDownWithError() throws {
        app = nil
    }

    // MARK: - Launch

    func testNavigationTitleIsVisible() {
        XCTAssertTrue(app.navigationBars["Comparison Slider"].exists)
    }

    // MARK: - Sheet flow

    func testThemeButtonOpensConfigurationSheet() {
        app.buttons["Theme"].tap()
        XCTAssertTrue(app.navigationBars["Configuration"].waitForExistence(timeout: 2))
    }

    func testDoneButtonDismissesConfigurationSheet() {
        app.buttons["Theme"].tap()
        _ = app.navigationBars["Configuration"].waitForExistence(timeout: 2)
        app.buttons["Done"].tap()
        XCTAssertTrue(app.navigationBars["Comparison Slider"].waitForExistence(timeout: 2))
    }

    // MARK: - Toggle state

    func testHandleToggleIsOnByDefault() {
        app.buttons["Theme"].tap()
        let toggle = app.switches["Handle"]
        _ = toggle.waitForExistence(timeout: 2)
        XCTAssertEqual(toggle.value as? String, "1")
    }

    func testTogglingHandleChangesItsState() {
        app.buttons["Theme"].tap()
        let toggle = app.switches["Handle"]
        _ = toggle.waitForExistence(timeout: 2)
        toggle.tap()
        XCTAssertEqual(toggle.value as? String, "0")
    }

    // MARK: - Preset selection

    func testSelectingOceanPresetShowsCheckmark() {
        app.buttons["Theme"].tap()
        _ = app.navigationBars["Configuration"].waitForExistence(timeout: 2)
        app.staticTexts["Ocean"].tap()
        XCTAssertTrue(app.images["checkmark"].exists)
    }
}
