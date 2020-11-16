import Resolver
import RxSwift
import RxRelay

protocol Login1PresenterOutput: class {
    func setWeak(viewController vc: Login1ViewControllerInput)
    func handleHomeButtonPressed()
    
    var currentUUID: BehaviorRelay<String> { get }
    var viewWillAppearTrigger: PublishRelay<Void> { get }
    var goToLogin2Trigger: PublishRelay<Void> { get }

}
protocol Login1PresenterInput: class { var viewController: Login1ViewControllerInput? { get } }

class Login1Presenter: Login1PresenterInput {
    @Injected var router: Login1RouterOutput
    @Injected var interactor: Login1InteractorOutput
    
    weak var viewController: Login1ViewControllerInput?
    
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
            .subscribe(onNext: { [weak self] _ in
                guard let currentSession = self?.interactor.getCurrentSession() else {
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
}


extension Login1Presenter: Login1PresenterOutput {
    func setWeak(viewController vc: Login1ViewControllerInput) { viewController = vc }
    func handleHomeButtonPressed() { router.goToLogin2() }
}
