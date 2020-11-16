import Resolver
import RxSwift

protocol HomeInteractorOutput: class {
    func setWeak(presenter pres: HomePresenterInput)
    func getCurrentSession() -> Observable<Session?>
}

class HomeInteractor { weak var presenter: HomePresenterInput! }

extension HomeInteractor: HomeInteractorOutput {
    func setWeak(presenter pres: HomePresenterInput) { presenter = pres }
    func getCurrentSession() -> Observable<Session?> {
        let getCurrentSession = Resolver.resolve(GetCurrentSessionQuery.self)
        return getCurrentSession.execute()
    }
}
