import Resolver

protocol MainPresenterOutput: class {}
protocol MainPresenterInput: class {}

class MainPresenter: MainPresenterInput, MainPresenterOutput {
    @Injected var router: MainRouterOutput
    @Injected var interactor: MainInteractorOutput
    
    weak var viewController: ViewInput!
}
