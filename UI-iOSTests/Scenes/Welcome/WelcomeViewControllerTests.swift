import XCTest
import UIKit
@testable import UI_iOS

class WelcomeViewControllerTests: XCTestCase {
    func test_loginButton_calls_login_on_tap() {
        let (sut, buttonSpy) = makeSut()
        sut.loginButton?.simulateTap()
        XCTAssertEqual(buttonSpy.clicks, 1)
    }
}

extension WelcomeViewControllerTests {
    func makeSut() -> (sut: WelcomeViewController, buttonSpy: ButtonSpy) {
        let buttonSpy = ButtonSpy()
        let sut = WelcomeViewController.instantiate()
        sut.login = buttonSpy.onClick
        sut.loadViewIfNeeded()
        return (sut, buttonSpy)
    }
    
    class ButtonSpy {
        var clicks = 0
        
        func onClick() -> Void {
            clicks += 1
        }
    }
}
