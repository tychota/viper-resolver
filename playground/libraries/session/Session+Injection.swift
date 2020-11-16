import Resolver

extension Resolver {
    public static func registerLibrarySession() {

        // Infra protocol
        register { resolve() as SessionStorage as GetCurrentSessionStorage }
        register { resolve() as SessionStorage as CreateNewSessionStorage}
        
        // Infra concrete
        register { SessionStorage() }
            .scope(cached)
        
        register { SessionController() }

        // Business
        register { GetCurrentSessionQuery() }
        register { CreateNewSessionCommand() }
    }
}
