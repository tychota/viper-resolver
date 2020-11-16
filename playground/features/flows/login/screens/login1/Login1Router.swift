import Resolver

protocol Login1RouterOutput: class {
    func setWeak(presenter pres: Login1PresenterInput)
    func goToLogin2()
}

class Login1Router { weak var presenter: Login1PresenterInput! }

extension Login1Router: Login1RouterOutput {
    func setWeak(presenter pres: Login1PresenterInput) { presenter = pres }
    func goToLogin2() {
        let loginNavigationRouter = Resolver.resolve(LoginNavigationRouter.self)
        loginNavigationRouter.goToLogin2()
    }
}
