import Resolver
import RxSwift
import RxRelay

class Login1Presenter {
    @Injected var router: Login1Router
    @Injected var interactor: Login1Interactor
    @LazyWeakInjected var viewController: Login1ViewController?
    
    let currentUUID = BehaviorRelay<String>(value: "")
    let viewWillAppearTrigger = PublishRelay<Void>()
    let goToLogin2Trigger = PublishRelay<Void>()
    let disposeBag = DisposeBag()
    
    init() {
        reactOnViewWillAppear()
        reactOnGoToLogin2Pressed()
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
    
    func reactOnGoToLogin2Pressed(){
        goToLogin2Trigger
            .subscribe(onNext: { [weak self] _ in
                self?.router.goToLogin2()
            })
            .disposed(by: disposeBag)
}
    func setWeak(viewController vc: Login1ViewController) { viewController = vc }
    func handleHomeButtonPressed() { router.goToLogin2() }
}
