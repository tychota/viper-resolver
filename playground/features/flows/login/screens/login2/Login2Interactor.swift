import Resolver

protocol Login2InteractorOutput: class {
    func setWeak(presenter pres: Login2PresenterInput)
    func getCurrentSession() -> Session?
}

class Login2Interactor { weak var presenter: Login2PresenterInput! }

extension Login2Interactor: Login2InteractorOutput {
    func setWeak(presenter pres: Login2PresenterInput) { presenter = pres }
    func getCurrentSession() -> Session? {
        let getCurrentSession = Resolver.resolve(GetCurrentSessionQuery.self)
        return getCurrentSession.execute()
    }
}
