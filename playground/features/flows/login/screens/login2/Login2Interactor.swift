import Resolver
import RxSwift

class Login2Interactor {
    weak var presenter: Login2Presenter!
    func setWeak(presenter pres: Login2Presenter) { presenter = pres }
    func getCurrentSession() -> Observable<Session?> {
        let getCurrentSession = Resolver.resolve(GetCurrentSessionQuery.self)
        return getCurrentSession.execute()
    }
}
