import Resolver
import RxSwift
import RxRelay

protocol LoginNavigationPresenterOutput: class {
    func setWeak(viewController vc: LoginNavigationViewControllerInput)
    var viewDidAppearTrigger: PublishRelay<Void> { get }

}
protocol LoginNavigationPresenterInput: class {
    var viewController: LoginNavigationViewControllerInput? { get }
}

class LoginNavigationPresenter: LoginNavigationPresenterInput {
    @Injected var router: LoginNavigationRouterOutput
    @Injected var interactor: LoginNavigationInteractorOutput
    weak var viewController: LoginNavigationViewControllerInput?
    
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
}

extension LoginNavigationPresenter: LoginNavigationPresenterOutput {
    func setWeak(viewController vc: LoginNavigationViewControllerInput) { viewController = vc }
}
