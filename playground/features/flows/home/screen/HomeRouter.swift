import Resolver

protocol HomeRouterOutput: class {
    func setWeak(presenter pres: HomePresenterInput)
    func logout()
}

class HomeRouter { weak var presenter: HomePresenterInput? }

extension HomeRouter: HomeRouterOutput {
    func setWeak(presenter pres: HomePresenterInput) { presenter = pres }
    func logout() {
        let rootRouter = Resolver.resolve(MainRouterOutput.self)
        rootRouter.presentLogin()
    }
}
