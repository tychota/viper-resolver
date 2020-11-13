import Resolver

protocol Login2RouterOutput: class {
    func setWeak(presenter pres: Login2PresenterInput)
    func login()
}

class Login2Router { weak var presenter: Login2PresenterInput! }

extension Login2Router: Login2RouterOutput {
    func setWeak(presenter pres: Login2PresenterInput) { presenter = pres }
    func login() {
        let rootRouter = Resolver.resolve(MainRouterOutput.self)
        rootRouter.presentHome()
    }
}
