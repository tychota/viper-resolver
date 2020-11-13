protocol LoginNavigationInteractorOutput: class { func setWeak(presenter pres: LoginNavigationPresenterInput) }

class LoginNavigationInteractor { weak var presenter: LoginNavigationPresenterInput! }

extension LoginNavigationInteractor: LoginNavigationInteractorOutput {
    func setWeak(presenter pres: LoginNavigationPresenterInput) { presenter = pres }
}
