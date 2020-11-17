import Resolver

extension Resolver {
    public static func registerFeatLogin() {
        registerLoginNavigation()
        registerLogin1()
        registerLogin2()
    }
}

extension Resolver {
    fileprivate static func registerLoginNavigation() {
        // VIPER concrete class
        register { LoginNavigationViewController() }.scope(shared)
        register { LoginNavigationPresenter() }.scope(shared)
        register { LoginNavigationInteractor() }.scope(shared)
        register { LoginNavigationRouter() }.scope(shared)
    }
}

extension Resolver {
    fileprivate static func registerLogin1() {
        // VIPER concrete class
        register { Login1ViewController() }.scope(shared)
        register { Login1Presenter() }.scope(shared)
        register { Login1Interactor() }.scope(shared)
        register { Login1Router() }.scope(shared)
    }
}

extension Resolver {
    fileprivate static func registerLogin2() {
        // VIPER concrete class
        register { Login2ViewController() }.scope(shared)
        register { Login2Presenter() }.scope(shared)
        register { Login2Interactor() }.scope(shared)
        register { Login2Router() }.scope(shared)
    }
}
