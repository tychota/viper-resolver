import Resolver

extension Resolver {
    public static func registerFeatRoot() {
        register { FeatRootModule() }
        // VIPER
        register { MainViewController() }
        register { MainInteractor() as MainInteractorOutput }
        register { MainPresenter() as MainPresenterOutput }
        register { MainRouter() as MainRouterOutput }
    }
}
