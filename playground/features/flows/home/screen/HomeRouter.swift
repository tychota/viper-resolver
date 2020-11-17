import Resolver

class HomeRouter {
    weak var presenter: HomePresenter?
    func setWeak(presenter pres: HomePresenter) { presenter = pres }
    func logout() {
        let rootRouter = Resolver.resolve(MainRouter.self)
        rootRouter.presentLogin()
    }
}
