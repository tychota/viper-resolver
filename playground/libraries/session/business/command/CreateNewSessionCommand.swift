import Resolver

protocol CreateNewSessionStorage {
    func createNew()
}

final class CreateNewSessionCommand {
    @Injected var storage: SessionStorage

    func execute() {
        storage.createNew()
    }
}

