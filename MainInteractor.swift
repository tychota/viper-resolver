protocol MainInteractorOutput: class {}

class MainInteractor: MainInteractorOutput {
    weak var presenter: MainPresenterInput!
}
