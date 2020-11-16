import Resolver
import RxSwift
import RxRelay

protocol Login2PresenterOutput: class {
    func setWeak(viewController vc: Login2ViewControllerInput)
    func handleHomeButtonPressed()
    func handleViewWillAppear()
    
    var currentUUID: BehaviorRelay<String> { get }
}
protocol Login2PresenterInput: class { var viewController: Login2ViewControllerInput? { get } }

class Login2Presenter {
    @Injected var router: Login2RouterOutput
    @Injected var interactor: Login2InteractorOutput
    weak var viewController: Login2ViewControllerInput?
    
    let currentUUID = BehaviorRelay<String>(value: "")
}

extension Login2Presenter: Login2PresenterInput {}

extension Login2Presenter: Login2PresenterOutput {
    
    func setWeak(viewController vc: Login2ViewControllerInput) { viewController = vc }
    func handleHomeButtonPressed() { router.login() }
    func handleViewWillAppear(){
        guard let currentSession = interactor.getCurrentSession(), let viewController = viewController else {
            return
        }
        currentUUID.accept(currentSession.id.uuidString)
    }
}
