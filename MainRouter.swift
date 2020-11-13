import Resolver
import UIKit

protocol MainRouterOutput: class {
    func setWeak(presenter pres: MainPresenterInput)
}

class MainRouter {
    weak var presenter: MainPresenterInput!
}
    
extension MainRouter: MainRouterOutput {
    func setWeak(presenter pres: MainPresenterInput) {
        presenter = pres
    }
}
