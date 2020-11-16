import Resolver
import RxSwift
import RxRelay

protocol HomePresenterOutput: class {
    func setWeak(viewController vc: HomeViewControllerInput)
    func handleLogoutButtonPressed()
    
    var currentUUID: BehaviorRelay<String> { get }
    var viewWillAppearTrigger: PublishRelay<Void> { get }
    var goToLoginTrigger: PublishRelay<Void> { get }

}
protocol HomePresenterInput: class { var viewController: HomeViewControllerInput? { get } }

class HomePresenter: HomePresenterInput {
    @Injected var router: HomeRouterOutput
    @Injected var interactor: HomeInteractorOutput
    weak var viewController: HomeViewControllerInput?
    
    let currentUUID = BehaviorRelay<String>(value: "")
    let viewWillAppearTrigger = PublishRelay<Void>()
    let goToLoginTrigger = PublishRelay<Void>()
    
    let disposeBag = DisposeBag()

    init() {
        reactOnViewWillAppear()
        reactOnGoToLogin()
    }
    
    func reactOnViewWillAppear(){
        viewWillAppearTrigger
            .flatMap { [weak self] _ -> Observable<Session?> in
                guard let currentSession = self?.interactor.getCurrentSession() else {
                    return Observable.just(nil)
                }
                return currentSession
            }
            .subscribe(onNext: { [weak self] currentSession in
                guard let currentSession = currentSession else {
                    return
                }
                self?.currentUUID.accept(currentSession.id.uuidString)
            })
            .disposed(by: disposeBag)
    }
    
    func reactOnGoToLogin(){
        goToLoginTrigger
            .subscribe(onNext: { [weak self] _ in
                self?.router.logout()
            })
            .disposed(by: disposeBag)
    }

}

extension HomePresenter: HomePresenterOutput {
    func setWeak(viewController vc: HomeViewControllerInput) { viewController = vc }
    func handleLogoutButtonPressed() { router.logout() }
}
