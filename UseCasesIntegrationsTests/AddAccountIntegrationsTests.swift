import XCTest
import Data
import Infra
import Domain

class AddAccountIntegrationsTests: XCTestCase {
    func test_add_account() throws {
        let alamofireAdapter = AlamofireAdapter()
        let url = URL(string: "http://clean-node-api.herokuapp.com/api/signup")!
//        let url = URL(string: "https://fordevs.herokuapp.com/api/signup")!
        let sut = RemoteAddAccount(url: url, httpClient: alamofireAdapter)
        let addAccountModel = AddAccountModel(name: "Abc zzz xxx", email: "aaabbbcccddd@meuemail.com", password: "secret123", passwordConfirmation: "secret123")
        let exp = expectation(description: "waiting")
        sut.add(addAccountModel: addAccountModel) { result in
            switch result {
            case .failure: XCTFail("Expected success got \(result) instead")
            case .success(let account):
                XCTAssertNotNil(account.id)
                XCTAssertEqual(account.name, addAccountModel.name)
            }
            exp.fulfill()
        }
        wait(for: [exp], timeout: 5)
    }
}
