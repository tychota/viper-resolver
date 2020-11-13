import Resolver

class FeatHomeModule {
    func getPresentation() -> UIViewController {
        return Resolver.resolve(HomeViewController.self)
    }
}
