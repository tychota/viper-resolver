import Foundation
import RxSwift

final class SessionStorage {
    var current: Session?
}

extension SessionStorage: GetCurrentSessionStorage {
    func getCurrent() -> Observable<Session?> {
        return Observable.just(self.current)
    }
}

extension SessionStorage: CreateNewSessionStorage {
    func createNew() -> Observable<Bool> {
        self.current = Session(id: UUID())
        return Observable.just(true)
    }
}
