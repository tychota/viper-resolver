import Resolver
import RxSwift
import RxRelay

protocol HomePresenterOutput: class {
    func setWeak(viewController vc: HomeViewControllerInput)
    func handleLogoutButtonPressed()
    
    var currentUUID: BehaviorRelay<String> { get }

}
protocol HomePresenterInput: class { var viewController: HomeViewControllerInput? { get } }

class HomePresenter: HomePresenterInput {
    @Injected var router: HomeRouterOutput
    @Injected var interactor: HomeInteractorOutput
    weak var viewController: HomeViewControllerInput?
    
    let currentUUID = BehaviorRelay<String>(value: "")

}

extension HomePresenter: HomePresenterOutput {
    func setWeak(viewController vc: HomeViewControllerInput) { viewController = vc }
    func handleLogoutButtonPressed() { router.logout() }
}
