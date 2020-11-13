import Resolver

protocol Login1PresenterOutput: class {}
protocol Login1PresenterInput: class {}

class Login1Presenter: Login1PresenterInput, Login1PresenterOutput {
    @Injected var router: Login1RouterOutput
    @Injected var interactor: Login1InteractorOutput
    
    weak var viewController: Login1ViewControllerInput!
}
