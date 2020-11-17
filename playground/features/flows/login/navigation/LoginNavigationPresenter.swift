import Resolver
import RxSwift
import RxRelay

class LoginNavigationPresenter {
    @Injected var router: LoginNavigationRouter
    @Injected var interactor: LoginNavigationInteractor
    weak var viewController: LoginNavigationViewController?
    
    let viewDidAppearTrigger = PublishRelay<Void>()
    let disposeBag = DisposeBag()
    
    init() {
        reactOnViewDidAppear()
    }
    
    func reactOnViewDidAppear(){
        viewDidAppearTrigger
            .subscribe(onNext: { [weak self] _ in
                self?.router.goToLogin1()
            })
            .disposed(by: disposeBag)
    }
    
    func setWeak(viewController vc: LoginNavigationViewController) { viewController = vc }
}
