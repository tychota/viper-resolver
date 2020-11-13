protocol Login1RouterOutput: class {
    func setWeak(presenter pres: Login1PresenterInput)
}

class Login1Router {
    weak var presenter: Login1PresenterInput!
}

extension Login1Router: Login1RouterOutput {
    func setWeak(presenter pres: Login1PresenterInput) {
        presenter = pres
    }
}

