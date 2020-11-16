import AsyncDisplayKit
import Resolver

protocol HomeViewControllerInput: class {}

class HomeViewController: ASViewController<ASDisplayNode>, HomeViewControllerInput {
    
    @Injected var presenter: HomePresenterOutput
    init() {
        super.init(node: HomeScreenNode())
        view.backgroundColor = .purple
    }
    required init?(coder _: NSCoder) { fatalError("init(coder:) has not been implemented") }
    
    override func viewWillAppear(_ animated: Bool) {
        presenter.viewWillAppearTrigger.accept(())
    }
}
