import AsyncDisplayKit
import Resolver

class LoginNavigationViewController: ASNavigationController {
    @Injected var presenter: LoginNavigationPresenter
    override func viewDidAppear(_ animated: Bool) { presenter.viewDidAppearTrigger.accept(()) }
    
    func navigate(viewController: UIViewController) {
        self.pushViewController(viewController, animated: true)
    }
}
