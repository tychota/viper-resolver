protocol HomeInteractorOutput: class {
    func setWeak(presenter pres: HomePresenterInput)
}

class HomeInteractor {
    weak var presenter: HomePresenterInput!
}

extension HomeInteractor: HomeInteractorOutput {
    func setWeak(presenter pres: HomePresenterInput) {
        presenter = pres
    }
}
