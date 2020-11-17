import Resolver

extension Resolver {
    public static func registerFeatHome() {
        // VIPER concrete class
        register { HomeViewController() }.resolveProperties { (_, viewController) in
            viewController.presenter.setWeak(viewController: viewController)
        }.scope(shared)
        register { HomePresenter() }.resolveProperties { _, presenter in
            presenter.router.setWeak(presenter: presenter)
            presenter.interactor.setWeak(presenter: presenter)
        }.scope(shared)
        register { HomeInteractor() }.scope(shared)
        register { HomeRouter() }.scope(shared)
    }
}
