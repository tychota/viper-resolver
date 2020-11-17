import Resolver

class Login2Router {
    @LazyWeakInjected var presenter: Login2Presenter?

    func login() {
        let rootRouter = Resolver.resolve(MainRouter.self)
        rootRouter.presentHome()
    }
}
