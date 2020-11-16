import AsyncDisplayKit
import Resolver

protocol LoginNavigationViewControllerInput: class {
    func navigate(viewController: UIViewController)
}

class LoginNavigationViewController: ASNavigationController {
    @Injected var presenter: LoginNavigationPresenterOutput
    override func viewDidAppear(_ animated: Bool) { presenter.viewDidAppearTrigger.accept(()) }
}

extension LoginNavigationViewController: LoginNavigationViewControllerInput {
    func navigate(viewController: UIViewController) {
        self.pushViewController(viewController, animated: true)
    }
}
