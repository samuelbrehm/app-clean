import Foundation
import Domain
import UI_iOS

public final class SignUpComposer {
    static func composeViewControllerWith(addAccount: AddAccount) -> SignUpViewController {
        return ControllerFactory.makeSignUp(addAccount: addAccount)
    }
}
