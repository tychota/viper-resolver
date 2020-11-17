import Resolver

class Login1Router {
    @LazyWeakInjected var presenter: Login1Presenter?
    func goToLogin2() {
        let loginNavigationRouter = Resolver.resolve(LoginNavigationRouter.self)
        loginNavigationRouter.goToLogin2()
    }
}
