import Resolver

protocol HomeInteractorOutput: class {
    func setWeak(presenter pres: HomePresenterInput)
    func getCurrentSession() -> Session?
}

class HomeInteractor { weak var presenter: HomePresenterInput! }

extension HomeInteractor: HomeInteractorOutput {
    func setWeak(presenter pres: HomePresenterInput) { presenter = pres }
    func getCurrentSession() -> Session? {
        let getCurrentSession = Resolver.resolve(GetCurrentSessionQuery.self)
        return getCurrentSession.execute()
    }
}
