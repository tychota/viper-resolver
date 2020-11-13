import Resolver

protocol MainPresenterOutput: class {
    func setWeak(viewController vc: MainViewControllerInput)
}

protocol MainPresenterInput: class {
    var viewController: MainViewControllerInput? { get }
}

class MainPresenter: MainPresenterInput {
    @Injected var router: MainRouterOutput
    @Injected var interactor: MainInteractorOutput
    
    weak var viewController: MainViewControllerInput?
}

extension MainPresenter: MainPresenterOutput {
    func setWeak(viewController vc: MainViewControllerInput) {
        viewController = vc
    }
}
