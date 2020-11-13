import AsyncDisplayKit
import Resolver

protocol HomeViewControllerInput: class {}

class HomeViewController: ASDKViewController<ASDisplayNode>, HomeViewControllerInput {
    @Injected var presenter: HomePresenterOutput
    override init() {
        super.init(node: HomeScreenNode())
        view.backgroundColor = .purple
    }
    required init?(coder _: NSCoder) { fatalError("init(coder:) has not been implemented") }
}
