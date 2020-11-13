import Resolver

extension Resolver {
    public static func registerFeatHome() {
        register { FeatHomeModule() }
        // VIPER
        register { HomeViewController() }
        register { HomeInteractor() as HomeInteractorOutput }
        register { HomePresenter() as HomePresenterOutput }
        register { HomeRouter() as HomeRouterOutput }
    }
}
