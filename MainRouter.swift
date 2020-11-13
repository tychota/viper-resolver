import Resolver
import UIKit

protocol MainRouterOutput: class {
    func setWeak(presenter pres: MainPresenterInput)
    func presentLogin()
    func presentHome()
}

class MainRouter {
    weak var presenter: MainPresenterInput?
    
    private func present(viewController targetViewController: UIViewController) {
        targetViewController.modalPresentationStyle = .overFullScreen
        
        guard let rootViewController: UIViewController = presenter?.viewController else { return }
        
        rootViewController.definesPresentationContext = true
        rootViewController.providesPresentationContextTransitionStyle = true
        
        if rootViewController.presentedViewController == nil {
            rootViewController.present(targetViewController, animated: false, completion: nil)
        } else {
            rootViewController.dismiss(animated: false) {
                rootViewController.present(targetViewController, animated: false, completion: nil)
            }
        }
    }
}
    
extension MainRouter: MainRouterOutput {
    func setWeak(presenter pres: MainPresenterInput) {
        presenter = pres
    }
    
    func presentLogin() {
        let viewController = Resolver.resolve(Login1ViewController.self)
        present(viewController: viewController)
    }
    
    func presentHome() {
        let viewController = Resolver.resolve(HomeViewController.self)
        present(viewController: viewController)
    }
}
