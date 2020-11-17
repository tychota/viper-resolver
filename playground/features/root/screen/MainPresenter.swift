import Resolver
import RxRelay
import RxSwift

class MainPresenter {
    @Injected var router: MainRouter
    @Injected var interactor: MainInteractor
    weak var viewController: MainViewController?
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
    
    func setWeak(viewController vc: MainViewController) { viewController = vc }

}
