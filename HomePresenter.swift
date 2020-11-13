import Resolver

protocol HomePresenterOutput: class {
    func setWeak(viewController vc: HomeViewControllerInput)
}
protocol HomePresenterInput: class {
    var viewController: HomeViewControllerInput? { get }
}

class HomePresenter: HomePresenterInput {
    @Injected var router: HomeRouterOutput
    @Injected var interactor: HomeInteractorOutput
    
    weak var viewController: HomeViewControllerInput?
}

extension HomePresenter: HomePresenterOutput {
    func setWeak(viewController vc: HomeViewControllerInput) {
        viewController = vc
    }
}
