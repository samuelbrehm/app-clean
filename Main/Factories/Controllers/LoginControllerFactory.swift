import Foundation
import UI_iOS
import Presentaion
import Validation
import Domain

public func makeLoginController() -> LoginViewController {
    return makeLoginControllerWith(authentication: makeRemoteAuthentication())
}

public func makeLoginControllerWith(authentication: Authentication) -> LoginViewController {
    let controller = LoginViewController.instantiate()
    let validationComposite = ValidationComposite(validations: makeLoginValidations())
    let presenter = LoginPresenter(validation: validationComposite, alertView: WeakVarProxy(controller), authentication: authentication, loadingView: WeakVarProxy(controller))
    controller.login = presenter.login
    return controller
}

public func makeLoginValidations() -> [Validation] {
    return ValidationBuilder.field("email").label("Email").required().email().build() +
        ValidationBuilder.field("password").label("Senha").required().build()
}
