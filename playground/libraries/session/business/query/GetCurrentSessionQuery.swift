import Resolver

protocol GetCurrentSessionStorage {
    func getCurrent() -> Session?
}

final class GetCurrentSessionQuery {
    @Injected var storage: GetCurrentSessionStorage
    
    func execute() -> Session? {
        storage.getCurrent()
    }
}

