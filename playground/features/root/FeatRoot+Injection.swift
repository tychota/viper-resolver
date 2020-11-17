import Resolver

extension Resolver {
    public static func registerFeatRoot() {
        // VIPER concrete class
        register { MainViewController() }.scope(shared)
        register { MainPresenter() }.scope(shared)
        register { MainInteractor() }.scope(shared)
        register { MainRouter() }.scope(shared)
    }
}
