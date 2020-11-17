import Resolver
import RxSwift

class Login1Interactor {
    weak var presenter: Login1Presenter!
    func setWeak(presenter pres: Login1Presenter) { presenter = pres }
    func getCurrentSession() -> Observable<Session?> {
        let getCurrentSession = Resolver.resolve(GetCurrentSessionQuery.self)
        return getCurrentSession.execute()
    }
}
