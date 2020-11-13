import Resolver

extension Resolver {
    public static func registerFeatLogin() {
        registerLogin1()
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
        }
        register { Login1Presenter() }.resolveProperties { _, presenter in presenter.router.setWeak(presenter: presenter)
            presenter.interactor.setWeak(presenter: presenter)
        }
        register { Login1Interactor() }
        register { Login1Router() }
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
        }
        register { Login2Presenter() }.resolveProperties { _, presenter in presenter.router.setWeak(presenter: presenter)
            presenter.interactor.setWeak(presenter: presenter)
        }
        register { Login2Interactor() }
        register { Login2Router() }
    }
}
