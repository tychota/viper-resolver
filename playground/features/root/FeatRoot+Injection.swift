import Resolver

extension Resolver {
    public static func registerFeatRoot() {
        // VIPER concrete class
        register { MainViewController() }.resolveProperties { (_, viewController) in
            viewController.presenter.setWeak(viewController: viewController)
        }.scope(shared)
        register { MainPresenter() }.resolveProperties { _, presenter in
            presenter.router.setWeak(presenter: presenter)
            presenter.interactor.setWeak(presenter: presenter)
        }.scope(shared)
        register { MainInteractor() }.scope(shared)
        register { MainRouter() }.scope(shared)
    }
}
