protocol Login2InteractorOutput: class { func setWeak(presenter pres: Login2PresenterInput) }

class Login2Interactor { weak var presenter: Login2PresenterInput! }

extension Login2Interactor: Login2InteractorOutput {
    func setWeak(presenter pres: Login2PresenterInput) { presenter = pres }
}
