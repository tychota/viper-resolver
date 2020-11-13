protocol MainInteractorOutput: class {
}

class MainInteractor {
    weak var presenter: MainPresenterInput!
}

extension MainInteractor: MainInteractorOutput {}
