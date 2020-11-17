import Resolver

class Login1Router {
    weak var presenter: Login1Presenter!
    func setWeak(presenter pres: Login1Presenter) { presenter = pres }
    func goToLogin2() {
        let loginNavigationRouter = Resolver.resolve(LoginNavigationRouter.self)
        loginNavigationRouter.goToLogin2()
    }
}
