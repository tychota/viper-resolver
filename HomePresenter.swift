import Resolver

protocol HomePresenterOutput: class {}
protocol HomePresenterInput: class {}

class HomePresenter: HomePresenterInput, HomePresenterOutput {
    @Injected var router: HomeRouterOutput
    @Injected var interactor: HomeInteractorOutput
    
    weak var viewController: ViewInput!
}
