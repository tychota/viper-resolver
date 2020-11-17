import Resolver
class LoginNavigationRouter {
    weak var presenter: LoginNavigationPresenter?
    func setWeak(presenter pres: LoginNavigationPresenter) { presenter = pres }
    func goToLogin1() {
        let viewController = Resolver.resolve(Login1ViewController.self)
        presenter?.viewController?.navigate(viewController: viewController)
    }
    func goToLogin2() {
        let viewController = Resolver.resolve(Login2ViewController.self)
        presenter?.viewController?.navigate(viewController: viewController)
    }
}
