import Resolver

protocol Login2PresenterOutput: class {
    func setWeak(viewController vc: Login2ViewControllerInput)
    func handleHomeButtonPressed()
}
protocol Login2PresenterInput: class { var viewController: Login2ViewControllerInput? { get } }

class Login2Presenter: Login2PresenterInput {
    @Injected var router: Login2RouterOutput
    @Injected var interactor: Login2InteractorOutput
    weak var viewController: Login2ViewControllerInput?
}

extension Login2Presenter: Login2PresenterOutput {
    func setWeak(viewController vc: Login2ViewControllerInput) { viewController = vc }
    func handleHomeButtonPressed() { router.login() }
}
