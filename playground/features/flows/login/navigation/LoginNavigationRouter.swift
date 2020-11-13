import Resolver

protocol LoginNavigationRouterOutput: class {
    func setWeak(presenter pres: LoginNavigationPresenterInput)
    func goToLogin1()
    func goToLogin2()
}

class LoginNavigationRouter { weak var presenter: LoginNavigationPresenterInput? }

extension LoginNavigationRouter: LoginNavigationRouterOutput {
    func setWeak(presenter pres: LoginNavigationPresenterInput) { presenter = pres }
    func goToLogin1() {
        let viewController = Resolver.resolve(Login1ViewController.self)
        presenter?.viewController?.navigate(viewController: viewController)
    }
    func goToLogin2() {
        let viewController = Resolver.resolve(Login2ViewController.self)
        presenter?.viewController?.navigate(viewController: viewController)
    }
}
