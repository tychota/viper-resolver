import Foundation

final class SessionStorage {
    var current: Session?
}

extension SessionStorage: GetCurrentSessionStorage {
    func getCurrent() -> Session? {
        return self.current
    }
}

extension SessionStorage: CreateNewSessionStorage {
    func createNew() {
        self.current = Session(id: UUID())
    }
}
