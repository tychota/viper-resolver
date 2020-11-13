protocol MainInteractorOutput: class {
    func setWeak(presenter pres: MainPresenterInput)
}

class MainInteractor  {
    weak var presenter: MainPresenterInput!
}

extension MainInteractor: MainInteractorOutput {
    func setWeak(presenter pres: MainPresenterInput) {
        presenter = pres
    }
}
