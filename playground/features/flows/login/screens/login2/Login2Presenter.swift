import Resolver
import RxSwift
import RxRelay

class Login2Presenter {
    @Injected var router: Login2Router
    @Injected var interactor: Login2Interactor
    @LazyWeakInjected var viewController: Login2ViewController?
    
    let currentUUID = BehaviorRelay<String>(value: "")
    let viewWillAppearTrigger = PublishRelay<Void>()
    let goToHomeTrigger = PublishRelay<Void>()
    let disposeBag = DisposeBag()
    
    init() {
        reactOnViewWillAppear()
        reactOnGoToHome()
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
    
    func reactOnGoToHome(){
        goToHomeTrigger
            .subscribe(onNext: { [weak self] _ in
                self?.router.login()
            })
            .disposed(by: disposeBag)
    }
    func setWeak(viewController vc: Login2ViewController) { viewController = vc }
    func handleHomeButtonPressed() { router.login() }
}
