import Resolver

extension Resolver {
    public static func registerFeatLogin() {
        register { FeatLoginModule() }
        // VIPER
        register { Login1ViewController() }
        register { Login1Interactor() as Login1InteractorOutput }
        register { Login1Presenter() as Login1PresenterOutput }
        register { Login1Router() as Login1RouterOutput }
    }
}
