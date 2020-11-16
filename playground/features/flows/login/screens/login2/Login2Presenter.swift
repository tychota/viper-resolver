import Resolver
import RxSwift
import RxRelay

protocol Login2PresenterOutput: class {
    func setWeak(viewController vc: Login2ViewControllerInput)
    func handleHomeButtonPressed()
    func handleViewWillAppear()
    
    var currentUUID: BehaviorRelay<String> { get }
    var goToHomeTrigger :PublishRelay<Void> { get }
}
protocol Login2PresenterInput: class { var viewController: Login2ViewControllerInput? { get } }

class Login2Presenter: Login2PresenterInput {
    @Injected var router: Login2RouterOutput
    @Injected var interactor: Login2InteractorOutput
    weak var viewController: Login2ViewControllerInput?
    
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
            .subscribe(onNext: { [weak self] _ in
                guard let currentSession = self?.interactor.getCurrentSession() else {
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
}

extension Login2Presenter: Login2PresenterOutput {
    
    func setWeak(viewController vc: Login2ViewControllerInput) { viewController = vc }
    func handleHomeButtonPressed() { router.login() }
    func handleViewWillAppear(){
        guard let currentSession = interactor.getCurrentSession() else {
            return
        }
        currentUUID.accept(currentSession.id.uuidString)
    }
}
