import Foundation
import UI_iOS
import Presentaion
import Validation
import Domain

class ControllerFactory {
    static func makeSignUp(addAccount: AddAccount) -> SignUpViewController {
        let controller = SignUpViewController.instanciate()
        let emailValidatorAdapter = EmailValidatorAdapter()
       
        let presenter = SignUpPresenter(alertView: controller, emailValidator: emailValidatorAdapter, addAccount: addAccount, loadingView: controller)
        controller.signUp = presenter.signup
        return controller
    }
}