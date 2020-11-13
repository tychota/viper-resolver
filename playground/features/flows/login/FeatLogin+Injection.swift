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
        // VIPER protocol
        register { resolve() as LoginNavigationPresenter as LoginNavigationPresenterOutput }
        register { resolve() as LoginNavigationInteractor as LoginNavigationInteractorOutput }
        register { resolve() as LoginNavigationRouter as LoginNavigationRouterOutput }
        // VIPER concrete class
        register { LoginNavigationViewController() }.resolveProperties { (_, viewController) in
            viewController.presenter.setWeak(viewController: viewController)
        }.scope(shared)
        register { LoginNavigationPresenter() }.resolveProperties { _, presenter in presenter.router.setWeak(presenter: presenter)
            presenter.interactor.setWeak(presenter: presenter)
        }.scope(shared)
        register { LoginNavigationInteractor() }.scope(shared)
        register { LoginNavigationRouter() }.scope(shared)
    }
}

extension Resolver {
    fileprivate static func registerLogin1() {
        // VIPER protocol
        register { resolve() as Login1Presenter as Login1PresenterOutput }
        register { resolve() as Login1Interactor as Login1InteractorOutput }
        register { resolve() as Login1Router as Login1RouterOutput }
        // VIPER concrete class
        register { Login1ViewController() }.resolveProperties { (_, viewController) in
            viewController.presenter.setWeak(viewController: viewController)
        }.scope(shared)
        register { Login1Presenter() }.resolveProperties { _, presenter in presenter.router.setWeak(presenter: presenter)
            presenter.interactor.setWeak(presenter: presenter)
        }.scope(shared)
        register { Login1Interactor() }.scope(shared)
        register { Login1Router() }.scope(shared)
    }
}

extension Resolver {
    fileprivate static func registerLogin2() {
        // VIPER protocol
        register { resolve() as Login2Presenter as Login2PresenterOutput }
        register { resolve() as Login2Interactor as Login2InteractorOutput }
        register { resolve() as Login2Router as Login2RouterOutput }
        // VIPER concrete class
        register { Login2ViewController() }.resolveProperties { (_, viewController) in
            viewController.presenter.setWeak(viewController: viewController)
        }.scope(shared)
        register { Login2Presenter() }.resolveProperties { _, presenter in presenter.router.setWeak(presenter: presenter)
            presenter.interactor.setWeak(presenter: presenter)
        }.scope(shared)
        register { Login2Interactor() }.scope(shared)
        register { Login2Router() }.scope(shared)
    }
}
