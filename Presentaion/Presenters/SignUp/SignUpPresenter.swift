import Foundation
import Domain

public final class SignUpPresenter {
    private var alertView: AlertView
    private var emailValidator: EmailValidator
    private var addAccount: AddAccount
    private var loadingView: LoadingView
    
    public init(alertView: AlertView, emailValidator: EmailValidator, addAccount: AddAccount, loadingView: LoadingView) {
        self.alertView = alertView
        self.emailValidator = emailValidator
        self.addAccount = addAccount
        self.loadingView = loadingView
    }
    
    public func signup(viewModel: SignUpViewModel) {
        if let message = validate(viewModel: viewModel) {
            alertView.showMessage(viewModel: AlertViewModel(title: "Falha na validação", message: message))
        } else {
            let addAccountModel = AddAccountModel(name: viewModel.name!, email: viewModel.email!, password: viewModel.password!, passwordConfirmation: viewModel.passwordConfirmation!)
            loadingView.display(viewModel: LoadingViewModel(isLoading: true))
            addAccount.add(addAccountModel: addAccountModel) { [weak self] result in
                guard let self = self else { return }
                switch result {
                case .failure: self.alertView.showMessage(viewModel: AlertViewModel(title: "Erro", message: "Algo inesperado aconteceu, tente novamente em alguns instantes"))
                case .success: self.alertView.showMessage(viewModel: AlertViewModel(title: "Sucesso", message: "Conta criada com sucesso."))
                }
                self.loadingView.display(viewModel: LoadingViewModel(isLoading: false))
            }
        }
    }
    
    private func validate(viewModel: SignUpViewModel) -> String? {
        if viewModel.name == nil || viewModel.name!.isEmpty {
            return "O campo Nome é obriagatório"
        } else if viewModel.email == nil || viewModel.email!.isEmpty {
            return "O campo Email é obriagatório"
        } else if viewModel.password == nil || viewModel.password!.isEmpty {
            return "O campo Senha é obriagatório"
        } else if viewModel.passwordConfirmation == nil || viewModel.passwordConfirmation!.isEmpty {
            return "O campo Confirmar Senha é obriagatório"
        } else if viewModel.password != viewModel.passwordConfirmation {
            return "O campo Confirmar Senha é inválido"
        } else if !emailValidator.isValid(email: viewModel.email!) {
            return "O campo Email é inválido"
        }
        
        return nil
    }
}