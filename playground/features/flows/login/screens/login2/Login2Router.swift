import Resolver

class Login2Router {
    weak var presenter: Login2Presenter!
    func setWeak(presenter pres: Login2Presenter) { presenter = pres }
    func login() {
        let rootRouter = Resolver.resolve(MainRouterOutput.self)
        rootRouter.presentHome()
    }
}
