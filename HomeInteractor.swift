protocol HomeInteractorOutput: class {}

class HomeInteractor: HomeInteractorOutput {
    weak var presenter: HomePresenterInput!
}
