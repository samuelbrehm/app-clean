import Foundation
import UI_iOS
import Presentaion
import Validation
import Domain
import Infra

public final class SignUpComposer {
    public static func composeViewControllerWith(addAccount: AddAccount) -> SignUpViewController {
        let controller = SignUpViewController.instanciate()
        let validationComposite = ValidationComposite(validations: makeValidations())
        let presenter = SignUpPresenter(alertView: WeakVarProxy(controller), addAccount: addAccount, loadingView: WeakVarProxy(controller), validation: validationComposite)
        controller.signUp = presenter.signup
        return controller
    }
    
    public static func makeValidations() -> [Validation] {
        return [
            RequiredFieldValidation(fieldName: "name", fieldLabel: "Nome"),
            EmailValidation(fieldName: "email", fieldLabel: "Email", emailValidator: EmailValidatorAdapter()),
            RequiredFieldValidation(fieldName: "email", fieldLabel: "Email"),
            RequiredFieldValidation(fieldName: "password", fieldLabel: "Senha"),
            RequiredFieldValidation(fieldName: "passwordConfirmation", fieldLabel: "Confirmar Senha"),
            CompareFieldsValidation(fieldName: "password", fieldNameToCompare: "passwordConfirmation", fieldLabel: "Confirmar Senha"),
        ]
    }
}
