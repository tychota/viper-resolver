import Resolver
import RxRelay
import RxSwift

protocol MainPresenterOutput: class {
    func setWeak(viewController vc: MainViewControllerInput)
    var viewDidAppearTrigger: PublishRelay<Void> { get }
}

protocol MainPresenterInput: class { var viewController: MainViewControllerInput? { get } }

class MainPresenter: MainPresenterInput {
    @Injected var router: MainRouterOutput
    @Injected var interactor: MainInteractorOutput
    weak var viewController: MainViewControllerInput?
    let viewDidAppearTrigger = PublishRelay<Void>()
    let disposeBag = DisposeBag()
    
    init() {
        reactOnViewDidAppear()
    }
    
    func reactOnViewDidAppear(){
        viewDidAppearTrigger
            .subscribe(onNext: { [weak self] _ in
                self?.router.presentLogin()
            })
            .disposed(by: disposeBag)
    }
}

extension MainPresenter: MainPresenterOutput {
    func setWeak(viewController vc: MainViewControllerInput) { viewController = vc }
}
