import Resolver
import RxSwift

protocol GetCurrentSessionStorage {
    func getCurrent() -> Observable<Session?>
}

final class GetCurrentSessionQuery {
    @Injected var storage: GetCurrentSessionStorage
    
    func execute() -> Observable<Session?> {
        storage.getCurrent()
    }
}

