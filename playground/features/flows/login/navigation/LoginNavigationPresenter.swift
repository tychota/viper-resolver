import Resolver

protocol LoginNavigationPresenterOutput: class {
    func setWeak(viewController vc: LoginNavigationViewControllerInput)
    func handleViewDidAppear()
}
protocol LoginNavigationPresenterInput: class {
    var viewController: LoginNavigationViewControllerInput? { get }
}

class LoginNavigationPresenter: LoginNavigationPresenterInput {
    @Injected var router: LoginNavigationRouterOutput
    @Injected var interactor: LoginNavigationInteractorOutput
    weak var viewController: LoginNavigationViewControllerInput?
}

extension LoginNavigationPresenter: LoginNavigationPresenterOutput {
    func setWeak(viewController vc: LoginNavigationViewControllerInput) { viewController = vc }
}
