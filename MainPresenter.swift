import Resolver

protocol MainPresenterOutput: class {}

protocol MainPresenterInput: class {
    var viewController: MainViewControllerInput? { get }
}

class MainPresenter: MainPresenterInput {
    @Injected var router: MainRouterOutput
    @Injected var interactor: MainInteractorOutput
    
    weak var viewController: MainViewControllerInput?
}

extension MainPresenter: MainPresenterOutput {
}
