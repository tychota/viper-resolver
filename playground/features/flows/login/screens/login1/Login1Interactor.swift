protocol Login1InteractorOutput: class {
    func setWeak(presenter pres: Login1PresenterInput)
}

class Login1Interactor {
    weak var presenter: Login1PresenterInput!
}

extension Login1Interactor: Login1InteractorOutput {
    func setWeak(presenter pres: Login1PresenterInput) {
        presenter = pres
    }
}
