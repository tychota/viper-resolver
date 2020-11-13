import Resolver

class FeatRootModule {
    func getPresentation() -> UIViewController {
        return Resolver.resolve(MainViewController.self)
    }
}
