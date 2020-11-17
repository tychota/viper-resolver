import Resolver
class LoginNavigationRouter {
    @LazyWeakInjected var presenter: LoginNavigationPresenter?
    func goToLogin1() {
        let viewController = Resolver.resolve(Login1ViewController.self)
        presenter?.viewController?.navigate(viewController: viewController)
    }
    func goToLogin2() {
        let viewController = Resolver.resolve(Login2ViewController.self)
        presenter?.viewController?.navigate(viewController: viewController)
    }
}
