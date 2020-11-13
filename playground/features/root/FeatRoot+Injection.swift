import Resolver

extension Resolver {
    public static func registerFeatRoot() {
        // VIPER protocol
        register { resolve() as MainPresenter as MainPresenterOutput }
        register { resolve() as MainInteractor as MainInteractorOutput }
        register { resolve() as MainRouter as MainRouterOutput }
        // VIPER concrete class
        register { MainViewController() }.resolveProperties { (_, viewController) in
            viewController.presenter.setWeak(viewController: viewController)
        }
        register { MainPresenter() }.resolveProperties { _, presenter in
            presenter.router.setWeak(presenter: presenter)
            presenter.interactor.setWeak(presenter: presenter)
        }
        register { MainInteractor() }
        register { MainRouter() }.scope(application)
    }
}
