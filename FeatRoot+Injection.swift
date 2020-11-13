import Resolver

extension Resolver {
    public static func registerFeatRoot() {
        register { FeatRootModule() }
        // VIPER protocol
        register { resolve() as MainPresenter as MainPresenterOutput }
        register { resolve() as MainInteractor as MainInteractorOutput }
        register { resolve() as MainRouter as MainRouterOutput }
        // VIPER concrete class
        register { MainViewController() }
        register { MainPresenter() }
        register { MainInteractor() }
        register { MainRouter() }
        
    }
}
