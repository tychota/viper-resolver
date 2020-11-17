import Resolver
import RxSwift

class Login2Interactor {
    @LazyWeakInjected var presenter: Login2Presenter?

    func getCurrentSession() -> Observable<Session?> {
        let getCurrentSession = Resolver.resolve(GetCurrentSessionQuery.self)
        return getCurrentSession.execute()
    }
}
