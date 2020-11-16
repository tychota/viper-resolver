import Resolver

final class SessionController {
    func getCurrent() -> Session? {
        let getCurrentSessionQuery = Resolver.resolve(GetCurrentSessionQuery.self)
        return getCurrentSessionQuery.execute()
    }
    
    func createNewSession() {
        let createNewSessionCommand = Resolver.resolve(CreateNewSessionCommand.self)
        return createNewSessionCommand.execute()
    }
}
