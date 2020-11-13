import Resolver
import UIKit

protocol MainRouterOutput: class {}

class MainRouter {
    weak var presenter: MainPresenterInput!
}
    
extension MainRouter: MainRouterOutput {}
