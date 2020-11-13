import Resolver

class FeatLoginModule {
    func getPresentation() -> UIViewController {
        return Resolver.resolve(Login1ViewController.self)
    }
}
