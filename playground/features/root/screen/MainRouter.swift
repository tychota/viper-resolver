import Resolver
import UIKit

class MainRouter {
    @LazyWeakInjected var presenter: MainPresenter?
    private func present(viewController targetViewController: UIViewController) {
        targetViewController.modalPresentationStyle = .overFullScreen
        guard let rootViewController: UIViewController = presenter?.viewController else { return }
        rootViewController.definesPresentationContext = true
        rootViewController.providesPresentationContextTransitionStyle = true
        if rootViewController.presentedViewController == nil {
            rootViewController.present(targetViewController, animated: false, completion: nil)
        }
        else {
            rootViewController.dismiss(animated: false) {
                rootViewController.present(targetViewController, animated: false, completion: nil)
            }
        }
    }
    
    func setWeak(presenter pres: MainPresenter) { presenter = pres }
    func presentLogin() {
        let viewController = Resolver.resolve(LoginNavigationViewController.self)
        present(viewController: viewController)
    }
    func presentHome() {
        let viewController = Resolver.resolve(HomeViewController.self)
        present(viewController: viewController)
    }
    
}
