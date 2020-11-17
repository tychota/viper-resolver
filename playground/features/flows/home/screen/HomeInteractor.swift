import Resolver
import RxSwift

class HomeInteractor {
    weak var presenter: HomePresenter!
    func setWeak(presenter pres: HomePresenter) { presenter = pres }
    func getCurrentSession() -> Observable<Session?> {
        let getCurrentSession = Resolver.resolve(GetCurrentSessionQuery.self)
        return getCurrentSession.execute()
    }
}
