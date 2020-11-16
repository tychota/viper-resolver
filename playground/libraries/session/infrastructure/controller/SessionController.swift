import Resolver
import RxSwift

final class SessionController {
    func getCurrent() -> Observable<Session?> {
        let getCurrentSessionQuery = Resolver.resolve(GetCurrentSessionQuery.self)
        return getCurrentSessionQuery.execute()
    }
    
    func createNewSession() -> Observable<Bool> {
        let createNewSessionCommand = Resolver.resolve(CreateNewSessionCommand.self)
        return createNewSessionCommand.execute()
    }
}
