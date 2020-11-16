import Resolver
import RxSwift

protocol CreateNewSessionStorage {
    func createNew() -> Observable<Bool>
}

final class CreateNewSessionCommand {
    @Injected var storage: SessionStorage

    func execute() -> Observable<Bool> {
        storage.createNew()
    }
}

