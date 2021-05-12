import Foundation

public final class SignUpPresenter {
    private var alertView: AlertView
    
    public init(alertView: AlertView) {
        self.alertView = alertView
    }
    
    public func signup(viewModel: SignUpViewModel) {
        if let message = validate(viewModel: viewModel) {
            alertView.showMessage(viewModel: AlertViewModel(title: "Falha na validação", message: message))
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
        }
        return nil
    }
}

public struct SignUpViewModel {
    public var name: String?
    public var email: String?
    public var password: String?
    public var passwordConfirmation: String?
    
    public init(name: String? = nil, email: String? = nil, password: String? = nil, passwordConfirmation: String? = nil) {
        self.name = name
        self.email = email
        self.password = password
        self.passwordConfirmation = passwordConfirmation
    }
}
