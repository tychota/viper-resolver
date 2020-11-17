import Resolver
import RxSwift
import RxRelay

class HomePresenter {
    @Injected var router: HomeRouter
    @Injected var interactor: HomeInteractor
    weak var viewController: HomeViewController?
    
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
    func setWeak(viewController vc: HomeViewController) { viewController = vc }
    func handleLogoutButtonPressed() { router.logout() }
}
