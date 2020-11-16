import Resolver
import RxSwift

protocol Login1InteractorOutput: class {
    func setWeak(presenter pres: Login1PresenterInput)
    func getCurrentSession() -> Observable<Session?>
}

class Login1Interactor { weak var presenter: Login1PresenterInput!}

extension Login1Interactor: Login1InteractorOutput {
    func setWeak(presenter pres: Login1PresenterInput) { presenter = pres }
    func getCurrentSession() -> Observable<Session?> {
        let getCurrentSession = Resolver.resolve(GetCurrentSessionQuery.self)
        return getCurrentSession.execute()
    }
}
