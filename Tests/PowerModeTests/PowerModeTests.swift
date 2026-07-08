//
//  PowerModeTests.swift
//  PowerModeTests
//
//  Deterministic tests for PowerMode's persisted settings, hex color parsing,
//  and view construction. These run headlessly on the simulator.
//

import XCTest
import UIKit
@testable import PowerMode

@MainActor
final class PowerModeTests: XCTestCase {

    override func setUp() {
        super.setUp()
        UserDefaults.standard.removeObject(forKey: "PowerModeIsSparkActionEnabled")
        UserDefaults.standard.removeObject(forKey: "PowerModeIsShakeActionEnabled")
    }

    override func tearDown() {
        UserDefaults.standard.removeObject(forKey: "PowerModeIsSparkActionEnabled")
        UserDefaults.standard.removeObject(forKey: "PowerModeIsShakeActionEnabled")
        super.tearDown()
    }

    func testSparkActionEnabledDefaultsTrueAndPersists() {
        XCTAssertTrue(PowerMode.isSparkActionEnabled)
        PowerMode.isSparkActionEnabled = false
        XCTAssertFalse(PowerMode.isSparkActionEnabled)
    }

    func testShakeActionEnabledDefaultsTrueAndPersists() {
        XCTAssertTrue(PowerMode.isShakeActionEnabled)
        PowerMode.isShakeActionEnabled = false
        XCTAssertFalse(PowerMode.isShakeActionEnabled)
    }

    func testHexStringParsesPrimaryColors() {
        let red = UIColor(hexString: "#FF0000")
        var r: CGFloat = 0, g: CGFloat = 0, b: CGFloat = 0, a: CGFloat = 0
        red.getRed(&r, green: &g, blue: &b, alpha: &a)
        XCTAssertEqual(r, 1.0, accuracy: 0.01)
        XCTAssertEqual(g, 0.0, accuracy: 0.01)
        XCTAssertEqual(b, 0.0, accuracy: 0.01)
    }

    func testSharedActionsAreStable() {
        XCTAssertTrue(SparkAction.shared === SparkAction.shared)
    }
}
