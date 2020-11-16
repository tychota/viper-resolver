import Resolver

protocol Login1PresenterOutput: class {
    func setWeak(viewController vc: Login1ViewControllerInput)
    func handleHomeButtonPressed()
    func handleViewWillAppear()
}
protocol Login1PresenterInput: class { var viewController: Login1ViewControllerInput? { get } }

class Login1Presenter: Login1PresenterInput {
    @Injected var router: Login1RouterOutput
    @Injected var interactor: Login1InteractorOutput
    
    weak var viewController: Login1ViewControllerInput?
}


extension Login1Presenter: Login1PresenterOutput {
    func setWeak(viewController vc: Login1ViewControllerInput) { viewController = vc }
    func handleHomeButtonPressed() { router.goToHome() }
    func handleViewWillAppear(){
        guard let currentSession = interactor.getCurrentSession(), let viewController = viewController else {
            return
        }
        viewController.setCurrentSession(currentSession: currentSession)
    }
}
