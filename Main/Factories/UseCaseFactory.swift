import Foundation
import Data
import Infra
import Domain

final class UseCaseFactory {
    static func makeRemoteAddAccount() -> AddAccount {
        let alamofireAdapter = AlamofireAdapter()
        let url = URL(string: "https://fordevs.herokuapp.com/api/signup")!
        return RemoteAddAccount(url: url, httpClient: alamofireAdapter)
    }
}
