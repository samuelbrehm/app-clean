import XCTest
import Infra

class EmailValidatorAdapterTests: XCTestCase {
    func test_invalid_emails() {
        let sut = makeSut()
        XCTAssertFalse(sut.isValid(email: "ss"))
        XCTAssertFalse(sut.isValid(email: "ss@"))
        XCTAssertFalse(sut.isValid(email: "ss@ss"))
        XCTAssertFalse(sut.isValid(email: "ss@ss."))
        XCTAssertFalse(sut.isValid(email: "@ss.com"))
    }
    
    func test_valid_emails() {
        let sut = makeSut()
        XCTAssertTrue(sut.isValid(email: "samuelbrehm@gmail.com"))
        XCTAssertTrue(sut.isValid(email: "samuelbrehm@hotmail.com.br"))
        XCTAssertTrue(sut.isValid(email: "samuelbrehm@hotmail.com"))
    }
}

extension EmailValidatorAdapterTests {
    func makeSut() -> EmailValidatorAdapter {
        return EmailValidatorAdapter()
    }
}
