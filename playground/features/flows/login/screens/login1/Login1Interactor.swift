import Resolver
import RxSwift

class Login1Interactor {
    @LazyWeakInjected var presenter: Login1Presenter?
    
    func getCurrentSession() -> Observable<Session?> {
        let getCurrentSession = Resolver.resolve(GetCurrentSessionQuery.self)
        return getCurrentSession.execute()
    }
}
